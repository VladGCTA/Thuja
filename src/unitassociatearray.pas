unit UnitAssociateArray;

{$mode ObjFPC}{$H+}

interface

type
  TSingleComment = record
    language: String;
    singleCommentOperator: String;
  end;

  TSingleCommentMap = record
    comment: array of TSingleComment;
  end;

  procedure addElement(var arrMap: TSingleCommentMap; language: String; singleCommentOperator:string);
  function findElement(arrMap: TSingleCommentMap; language: String): String;

implementation

  procedure addElement(var arrMap: TSingleCommentMap; language: String; singleCommentOperator:string);
  var
    newIndex: Integer;
    i: Integer;
  begin

    for i := 0 to High(arrMap.comment) do
    begin
      if arrMap.comment[i].language = language then
      begin
        arrMap.comment[i].language := language;
        Exit;
      end;
    end;
    newIndex := Length(arrMap.comment);
    SetLength(arrMap.comment, newIndex + 1);

    arrMap.comment[newIndex].language := language;
    arrMap.comment[newIndex].singleCommentOperator := singleCommentOperator;
  end;

  function findElement(arrMap: TSingleCommentMap; language: String): String;
  var
    i: Integer;
  begin
    if Length(arrMap.comment) = 0 then
      begin
        Result := '';
        Exit;
      end;

    for i := Low(arrMap.comment) to High(arrMap.comment) do
    begin
      if arrMap.comment[i].language = language then
        begin
          Result := arrMap.comment[i].singleCommentOperator;
          Exit;
        end;
    end;
    Result := '';
  end;

end.

