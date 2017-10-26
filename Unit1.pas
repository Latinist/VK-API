unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, httpsend, lib;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    response, token, uid: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
temp, login, pass: string;
begin
  login:=Edit1.Text;
  pass:=Edit2.Text;
  response:=send('GET', 'https://oauth.vk.com/token?grant_type=password&client_id=2274003&client_secret=hHbZxrka2uZ6jB1inYsH&username='+login+'&password='+pass+'&captcha_key=&captcha_sid=');
  if Pos('token', response)<>0 then begin
    temp:=copy(response, pos('access_token":"', response), pos('","expires_in', response)-3);
    delete(temp, 1, 15);
    token:=temp;
    Memo1.Lines.Add('Авторизация успешна');
  end
  else memo1.Lines.Add('Ошибка авторизации');
end;

end.
