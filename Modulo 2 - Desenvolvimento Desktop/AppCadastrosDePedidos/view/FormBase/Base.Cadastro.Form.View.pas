unit Base.Cadastro.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Objects, System.ImageList,
  FMX.ImgList, FMX.Edit, FMX.DateTimeCtrls;

type
  TFrBaseCadastros = class(TForm)
    ToolBar1: TToolBar;
    TCPadrao: TTabControl;
    TbResultado: TTabItem;
    TbCadastro: TTabItem;
    Rectangle1: TRectangle;
    BtnEdit: TImage;
    BtnInsert: TImage;
    BtnSave: TImage;
    BtnCancel: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    SgDados: TStringGrid;
    Rectangle2: TRectangle;
    lblTitulo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure SgDadosCellClick(const Column: TColumn; const Row: Integer);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure BtnInsertClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure SgDadosCellDblClick(const Column: TColumn; const Row: Integer);
  protected
     FLimparComponenete: Boolean;
     procedure AtualizaRowCount(AValor:Integer);
     procedure ControleVisualCadastro(AValue: Boolean);
  private
    FRowAtual : integer;
    procedure MoverTabCadastro;
    procedure ControlesVisuais(AValue: Boolean);
  public
    { Public declarations }
  end;

var
  FrBaseCadastros: TFrBaseCadastros;

implementation

{$R *.fmx}

procedure TFrBaseCadastros.ControleVisualCadastro(AValue: Boolean);
begin
    for var I := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then
    begin
      TEdit(Components[i]).Enabled := AValue;
      if  FLimparComponenete then
        TEdit(Components[i]).Text := '';
    end;

   if Components[i] is TDateEdit then
   begin
    TDateEdit(Components[i]).Enabled := AValue;

    if  FLimparComponenete then
        TDateEdit(Components[i]).Date := now;
   end;
  end;
end;

procedure TFrBaseCadastros.ControlesVisuais(AValue: Boolean);
begin
  BtnInsert.Enabled := AValue;
  BtnEdit.Enabled   := AValue;

  BtnSave.Enabled   := not AValue;
  BtnCancel.Enabled := not AValue;
end;

procedure TFrBaseCadastros.FormCreate(Sender: TObject);
begin
  TCPadrao.ActiveTab := TbResultado;
  SgDados.SelectRow(0);
  FLimparComponenete := false;
  ControlesVisuais(true);
end;

procedure TFrBaseCadastros.BtnEditClick(Sender: TObject);
begin
  FLimparComponenete := true;
  ControlesVisuais(False);
  MoverTabCadastro;
end;

procedure TFrBaseCadastros.BtnInsertClick(Sender: TObject);
begin
  FLimparComponenete := True;
  ControlesVisuais(False);
  MoverTabCadastro;
end;

procedure TFrBaseCadastros.BtnSaveClick(Sender: TObject);
begin
  FLimparComponenete := false;
  ControlesVisuais(True);
end;

procedure TFrBaseCadastros.AtualizaRowCount(AValor: Integer);
begin
  SgDados.RowCount := AValor;
end;

procedure TFrBaseCadastros.BtnCancelClick(Sender: TObject);
begin
  FLimparComponenete := true;
  ControlesVisuais(True);
  TCPadrao.ActiveTab := TbResultado;
end;

procedure TFrBaseCadastros.MoverTabCadastro;
begin
  TCPadrao.ActiveTab := TbCadastro;
end;

procedure TFrBaseCadastros.Image5Click(Sender: TObject);
begin
 SgDados.SelectRow(0);
end;

procedure TFrBaseCadastros.Image6Click(Sender: TObject);
begin
    SgDados.SelectRow(SgDados.Row -1);
end;

procedure TFrBaseCadastros.Image8Click(Sender: TObject);
begin
    SgDados.SelectRow(SgDados.Row +1);
end;

procedure TFrBaseCadastros.Image9Click(Sender: TObject);
begin
  SgDados.SelectRow(SgDados.RowCount-1);
end;

procedure TFrBaseCadastros.SgDadosCellClick(const Column: TColumn; const Row: Integer);
begin
  FRowAtual := Row;
end;

procedure TFrBaseCadastros.SgDadosCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
   TCPadrao.ActiveTab := TbCadastro;
end;

end.
