with Ada.Text_IO, Ada.Integer_Text_IO, Ustrings, Boards;
use Ada.Text_IO, Ada.Integer_Text_IO, Ustrings, Boards;

procedure Abacan is
    Game_Board       : Board := (1, 3, 5, 7, 9);
    Player1, Player2 : Ustring;
    P1_Turn          : Boolean := True;
    Wire, Num_Beads  : Integer;
begin
    Put ("Name of player 1: ");
    Get_Line (Player1);
    Put ("Name of player 2: ");
    Get_Line (Player2);

    loop
        Print_Board (Game_Board);

        Put ("Turn: ");
        if P1_Turn then
            Put_Line (Player1);
        else
            Put_Line (Player2);
        end if;

        loop
            Put ("Select wire [1-5]: ");
            Get (Wire);

            Put ("Number of beads to move [1-3]: ");
            Get (Num_Beads);
            if not Can_Move (Game_Board, Wire, Num_Beads) then
                Put_Line ("Unable to make that move. Try again.");
            end if;
            exit when Can_Move (Game_Board, Wire, Num_Beads);
        end loop;

        Move (Game_Board, Wire, Num_Beads);

        P1_Turn := not P1_Turn;

        exit when Game_Over (Game_Board);
    end loop;

    if P1_Turn then
        Put (Player1);
    else
        Put (Player2);
    end if;
    Put_Line (" wins!");

end Abacan;