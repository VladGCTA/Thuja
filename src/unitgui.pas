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
  FileName: String;
  Language: String;
  CurrentSingleComment: String; { Contain chosen single comment string (#
  in python, // in C, C++ or Pascal and etc. Available comment symbols
  are defined in UnitSingleComments}

begin
  FileName := Self.OpenDialogChooseFile.FileName;
  Language := LanguagesComboBox.Text;
  CurrentSingleComment := FindElement(CommentMap, Language);
  try
    Self.EditEnterFileName.Text := IntToStr(UnitParseSourseCode.ReadSourceCodeFile(FileName, CurrentSingleComment));
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
    if not FileExists(OpenDialogChooseFile.FileName) then
    begin
      ShowMessage('File doesn''t exist!'); // Message if file doesn't exist
    end;
  end
  else
  begin
    ShowMessage('No file selected'); // Message if file didn't selected
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

end;

end.

