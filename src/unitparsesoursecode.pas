unit UnitParseSourseCode;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils;

var
  SourceCodeFile: TextFile; // Contain reading text file
  CurrentLine: String; // Temp string with current line
  i: Integer; // Temp int for loop

function ReadSourceCodeFile(FileName: String; CurrentSingleComment: String): Integer;

implementation

  function StartWith(SubStr: String; SourceStr: String): Boolean;
  {Return True if string start with substring, else return False}
  begin
    Result := Copy(SourceStr, 1, Length(subStr)) = SubStr;
  end;

  function isEmpty(CurrentString: String): Boolean;
  {Return True if string empty else return False}
  begin
    Result := CurrentString = '';
  end;

  function IsSingleComment(CurrentString: String; CurrentSingleComment: String): Boolean;
  {Return True if string contain only single comment (Start with single
  comment) else return False}
  begin
    Result := StartWith(CurrentSingleComment, Trim(CurrentString));
  end;

  function ReadSourceCodeFile(FileName: String; CurrentSingleComment: String): Integer;
  begin
    // Assing File
    AssignFile(SourceCodeFile, FileName);

    try
      Reset(SourceCodeFile);
      Result := 0;

      while not EOF(SourceCodeFile) do
      begin
        ReadLn(SourceCodeFile, CurrentLine);


        if not (isEmpty(CurrentLine)) and not (IsSingleComment(CurrentLine, CurrentSingleComment)) then
        begin
          Result := Result + 1;
        end;
      end;

      CloseFile(SourceCodeFile); // Close file if all gone good

    except
      on Ex: Exception do
      begin
        CloseFile(SourceCodeFile); // Close file if there are error
      end;

    end;

  end;


end.

