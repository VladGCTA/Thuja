unit UnitAssociateArray;

{$mode ObjFPC}{$H+}

interface

type
  {Simple assotiate array with key=Language (string) and value=single Comment
  operator (string)}
  TSingleComment = record
    Language: String;
    SingleCommentOperator: String;
  end;

  TSingleCommentMap = record
    Comment: array of TSingleComment;
  end;

  procedure AddElement(var ArrMap: TSingleCommentMap; Language: String; SingleCommentOperator:string);
  function FindElement(ArrMap: TSingleCommentMap; Language: String): String;

implementation

  procedure AddElement(var ArrMap: TSingleCommentMap; Language: String; SingleCommentOperator:string);
  var
    NewIndex: Integer;
    i: Integer;
  begin

    for i := 0 to High(ArrMap.Comment) do
    begin
      if ArrMap.Comment[i].Language = Language then
      begin
        ArrMap.Comment[i].Language := Language;
        Exit;
      end;
    end;
    NewIndex := Length(ArrMap.Comment);
    SetLength(ArrMap.Comment, NewIndex + 1);

    ArrMap.Comment[NewIndex].Language := Language;
    ArrMap.Comment[NewIndex].SingleCommentOperator := SingleCommentOperator;
  end;

  function FindElement(ArrMap: TSingleCommentMap; Language: String): String;
  var
    i: Integer;
  begin
    if Length(ArrMap.Comment) = 0 then
      begin
        Result := '';
        Exit;
      end;

    for i := Low(ArrMap.Comment) to High(ArrMap.Comment) do
    begin
      if ArrMap.Comment[i].Language = Language then
        begin
          Result := ArrMap.Comment[i].SingleCommentOperator;
          Exit;
        end;
    end;
    Result := '';
  end;

end.

