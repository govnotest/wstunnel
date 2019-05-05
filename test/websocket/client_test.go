package websocket

import (
	"net/url"

	"testing"

	"fmt"

	"golang.org/x/net/websocket"
)

type Client struct {
	Host string
	Path string
}

func NewWebsocketClient(host, path string) *Client {
	return &Client{
		Host: host,
		Path: path,
	}
}

func (this *Client) SendMessage(body []byte) error {
	u := url.URL{Scheme: "ws", Host: this.Host, Path: this.Path}

	ws, err := websocket.Dial(u.String(), "", "https://"+this.Host+"/")
	if err != nil {
		fmt.Printf("Dial err:%s \n", err.Error())
		return err
	}
	defer ws.Close() //关闭连接

	_, err = ws.Write(body)
	if err != nil {
		fmt.Printf("Write err:%s \n", err.Error())
		return err
	}

	return nil
}

func TestClient(t *testing.T) {
	wsClient := Client{
		//Host: "wstunnel-74y4kmeiba-uc.a.run.app:443",
		Host: "127.0.0.1:80",
		Path: "/",
	}

	if err := wsClient.SendMessage([]byte("test message")); err != nil {
		t.Logf("error:%s", err.Error())
	} else {
		t.Log("success")
	}

}
