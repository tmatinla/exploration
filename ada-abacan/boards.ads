with Ada.Text_IO;
use Ada.Text_IO;

package Boards is
    type Board is array(1 .. 5) of Integer;
    procedure Print_Board (Game_Board : in Board);
    function Game_Over (Game_Board : Board) return Boolean;
    function Can_Move (Game_Board : Board; Wire : Integer; Num_Beads : Integer) return Boolean;
    procedure Move (Game_Board : in out Board; Wire : in Integer; Num_Beads : in Integer);
end Boards;
