unit UnitGUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, StdCtrls, Buttons, Menus,
  UnitParseSourseCode, UnitAssociateArray, UnitSingleComments;

type

  { TMainForm }

  TMainForm = class(TForm)
    LanguagesComboBox: TComboBox;
    EditEnterFileName: TEdit;
    LabelFileName: TLabel;
    ButtonOk: TSpeedButton;
    procedure ButtonOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PushEnter(Sender: TObject; var Key: Word);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.ButtonOkClick(Sender: TObject);
var
  fileName: String;
  language: String;
  currentSingleComment: String;
begin
  fileName := Self.EditEnterFileName.Text;
  language := LanguagesComboBox.Text;
  currentSingleComment := findElement(commentMap, language);
  try
    ShowMessage('Code lines: ' + IntToStr(UnitParseSourseCode.readSourceCodeFile(fileName, currentSingleComment)));
  except
    on Ex: Exception do
    begin
      ShowMessage('Error: ' + Ex.Message);
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

end;

procedure TMainForm.PushEnter(Sender: TObject; var Key: Word);
begin
  if Key = 13 then // if press Enter key
  begin
  ButtonOKClick(Sender);
  end;
end;

end.

