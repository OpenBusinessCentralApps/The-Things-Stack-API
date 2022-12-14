page 77182 "obc TTS Demo Setup Card"
{
    PageType = Card;
    ApplicationArea = All;

    Caption = 'TTS Demo Setup';

    UsageCategory = Administration;
    SourceTable = "obc TTS Demo Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Enable Webservice Calls"; Rec."Enable Webservice Calls")
                {
                    ApplicationArea = All;
                    ToolTip = 'Required to communicate with The Things Stack REST Services';
                }

                field("Default API Key"; Rec."Default API Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Default API Key';
                }
            }
        }
    }
}