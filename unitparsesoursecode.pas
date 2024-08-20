unit UnitParseSourseCode;

{$mode ObjFPC}{$H+}

interface

uses Classes, SysUtils;

var
  sourceCodeFile: TextFile;
  currentLine: String;
  i: Integer;

function readsourceCodeFile(fileName: String; currentSingleComment: String): Integer;

implementation

  function startWith(subStr: String; sourceStr: String): Boolean;
  begin
    Result := Copy(sourceStr, 1, Length(subStr)) = subStr;
  end;

  function isEmpty(currentString: String): Boolean;
  begin
    Result := currentString = '';
  end;

  function isSingleComment(currentString: String; currentSingleComment: String): Boolean;
  begin
    Result := startWith(currentSingleComment, Trim(currentString));
  end;

  function readsourceCodeFile(fileName: String; currentSingleComment: String): Integer;
  begin
    // Assing
    AssignFile(sourceCodeFile, fileName);

    try
      Reset(sourceCodeFile);
      Result := 0;

      while not EOF(sourceCodeFile) do
      begin
        ReadLn(sourceCodeFile, currentLine);


        if not (isEmpty(currentLine)) and not (isSingleComment(currentLine, currentSingleComment)) then
        begin
          Result := Result + 1;
        end;
      end;

      CloseFile(sourceCodeFile);

    except
      on Ex: Exception do
      begin
        CloseFile(sourceCodeFile);
      end;

    end;

  end;


end.

