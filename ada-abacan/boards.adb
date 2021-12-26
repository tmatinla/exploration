with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Boards is

    procedure Print_Board (Game_Board : in Board) is
        Total_Beads: Integer;
    begin
        for i in 1 .. 5 loop
            Total_Beads := 2 * i - 1;
            Put (i);
            for s in 1 .. 7 - i loop
                Put (" ");
            end loop;
            for b in 1 .. Total_Beads loop
                if Game_Board(i) = b - 1 then
                    Put ("--");
                end if;
                Put ("*");
            end loop;
            if Game_Board(i) = Total_Beads then
                Put ("--");
            end if;
            New_Line;
        end loop;
    end Print_Board;

    function Game_Over (Game_Board : Board) return Boolean is
    begin
      for i in 1 .. 5 loop
        if Game_Board(i) > 0 then
            return False;
        end if;
      end loop;
      return True;
    end Game_Over;

    function Can_Move (Game_Board : Board; Wire : Integer; Num_Beads : Integer) return Boolean is
    begin
        return Num_Beads > 0 and then Num_Beads <= 3 and then Game_Board(Wire) - Num_Beads >= 0;
    end Can_Move;

    procedure Move (Game_Board : in out Board; Wire : in Integer; Num_Beads : in Integer) is
    begin
        Game_Board(Wire) := Game_Board(Wire) - Num_Beads;
    end Move;

end Boards;