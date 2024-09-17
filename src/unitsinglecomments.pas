unit UnitSingleComments;

{$mode ObjFPC}{$H+}

interface

uses
  UnitAssociateArray;

var CommentMap: TSingleCommentMap;

procedure initializationCommentMap;

implementation

  procedure initializationCommentMap;
  begin
    SetLength(CommentMap.Comment, 0);

    addElement(CommentMap, 'Pascal', '//');
    addElement(CommentMap, 'C++', '//');
    addElement(CommentMap, 'C', '//');
    addElement(CommentMap, 'Java', '//');

    addElement(CommentMap, 'Python', '#');
  end;

end.

