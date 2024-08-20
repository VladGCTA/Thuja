unit UnitSingleComments;

{$mode ObjFPC}{$H+}

interface

uses
  UnitAssociateArray;

var commentMap: TSingleCommentMap;

procedure initializationCommentMap;

implementation

  procedure initializationCommentMap;
  begin
    SetLength(CommentMap.comment, 0);

    addElement(commentMap, 'Pascal', '//');
    addElement(commentMap, 'C++', '//');
    addElement(commentMap, 'C', '//');
    addElement(commentMap, 'Java', '//');

    addElement(commentMap, 'Python', '#');
  end;

end.

