unit UnitGUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, StdCtrls, Buttons, Menus, ExtCtrls,
  UnitParseSourseCode, UnitAssociateArray, UnitSingleComments;

type

  { TMainForm }

  TMainForm = class(TForm)
    LanguagesComboBox: TComboBox;
    EditEnterFileName: TEdit;    LabelFileName: TLabel;
    ButtonOk: TSpeedButton;
    OpenDialogChooseFile: TOpenDialog;
    ButtonOpenFile: TSpeedButton;
    PanelButton: TPanel;
    procedure ButtonChooseFileClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  fileName := Self.OpenDialogChooseFile.FileName;
  language := LanguagesComboBox.Text;
  currentSingleComment := findElement(commentMap, language);
  try
    self.EditEnterFileName.Text := IntToStr(UnitParseSourseCode.readSourceCodeFile(fileName, currentSingleComment));
  except
    on Ex: Exception do
    begin
      ShowMessage('Error: ' + Ex.Message);
    end;
  end;
end;

procedure TMainForm.ButtonChooseFileClick(Sender: TObject);
begin
  if OpenDialogChooseFile.Execute then
  begin
    if not fileExists(OpenDialogChooseFile.Filename) then
    begin
      ShowMessage('File doesn''t exist!');
    end;
  end
  else
  begin
    ShowMessage('No file selected');
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

end;

end.

