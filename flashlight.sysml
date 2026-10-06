package Flashlight {
    private import ScalarValues::*;

    enum def BeamMode {
        low;
        high;
        strobe;
    }

    part def Body;
    part def Battery {
        attribute voltage : Real = 3.0;
    }
    part def Bulb {
        attribute beam : BeamMode = BeamMode::high;
    }
    part def Switch;
    item def SwitchOn;
    item def SwitchOff;

    part flashlight[1] {
        part body : Body;
        part battery : Battery;
        part bulb : Bulb;
        part power : Switch {
            state def OnOff {
                entry; then off;
                state off;
                transition off_to_on
                    first off accept SwitchOn then on;
                state on;
                transition on_to_off
                    first on accept SwitchOff then off;
            }
            exhibit state onOff : OnOff;
        }
    }
}
