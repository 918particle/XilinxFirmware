<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="D" />
        <signal name="CLK" />
        <signal name="Q" />
        <port polarity="Input" name="D" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q" />
        <blockdef name="shift_reg128">
            <timestamp>2011-8-12T9:6:32</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="shift_reg128" name="XLXI_1">
            <blockpin signalname="D" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_1" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_2" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_3">
            <blockpin signalname="XLXN_2" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_3" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_4">
            <blockpin signalname="XLXN_3" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_4" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_5">
            <blockpin signalname="XLXN_4" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_5" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_6">
            <blockpin signalname="XLXN_5" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_6" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_7">
            <blockpin signalname="XLXN_6" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="XLXN_7" name="Q" />
        </block>
        <block symbolname="shift_reg128" name="XLXI_8">
            <blockpin signalname="XLXN_7" name="D" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="1312" y="2624" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1904" y="2624" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2512" y="2624" name="XLXI_3" orien="R0">
        </instance>
        <instance x="3104" y="2624" name="XLXI_4" orien="R0">
        </instance>
        <instance x="3696" y="2624" name="XLXI_5" orien="R0">
        </instance>
        <instance x="4272" y="2624" name="XLXI_6" orien="R0">
        </instance>
        <instance x="4848" y="2624" name="XLXI_7" orien="R0">
        </instance>
        <instance x="5440" y="2624" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1904" y1="2528" y2="2528" x1="1696" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="2512" y1="2528" y2="2528" x1="2288" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="3104" y1="2528" y2="2528" x1="2896" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="3696" y1="2528" y2="2528" x1="3488" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="4272" y1="2528" y2="2528" x1="4080" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="4848" y1="2528" y2="2528" x1="4656" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="5440" y1="2528" y2="2528" x1="5232" />
        </branch>
        <branch name="D">
            <wire x2="1296" y1="2528" y2="2528" x1="912" />
            <wire x2="1312" y1="2528" y2="2528" x1="1296" />
        </branch>
        <branch name="CLK">
            <wire x2="1216" y1="2592" y2="2592" x1="912" />
            <wire x2="1296" y1="2592" y2="2592" x1="1216" />
            <wire x2="1312" y1="2592" y2="2592" x1="1296" />
            <wire x2="1216" y1="2592" y2="2688" x1="1216" />
            <wire x2="1856" y1="2688" y2="2688" x1="1216" />
            <wire x2="2480" y1="2688" y2="2688" x1="1856" />
            <wire x2="3072" y1="2688" y2="2688" x1="2480" />
            <wire x2="3664" y1="2688" y2="2688" x1="3072" />
            <wire x2="4224" y1="2688" y2="2688" x1="3664" />
            <wire x2="4784" y1="2688" y2="2688" x1="4224" />
            <wire x2="5296" y1="2688" y2="2688" x1="4784" />
            <wire x2="1904" y1="2592" y2="2592" x1="1856" />
            <wire x2="1856" y1="2592" y2="2688" x1="1856" />
            <wire x2="2512" y1="2592" y2="2592" x1="2480" />
            <wire x2="2480" y1="2592" y2="2688" x1="2480" />
            <wire x2="3104" y1="2592" y2="2592" x1="3072" />
            <wire x2="3072" y1="2592" y2="2688" x1="3072" />
            <wire x2="3696" y1="2592" y2="2592" x1="3664" />
            <wire x2="3664" y1="2592" y2="2688" x1="3664" />
            <wire x2="4272" y1="2592" y2="2592" x1="4224" />
            <wire x2="4224" y1="2592" y2="2688" x1="4224" />
            <wire x2="4848" y1="2592" y2="2592" x1="4784" />
            <wire x2="4784" y1="2592" y2="2688" x1="4784" />
            <wire x2="5296" y1="2592" y2="2688" x1="5296" />
            <wire x2="5440" y1="2592" y2="2592" x1="5296" />
        </branch>
        <branch name="Q">
            <wire x2="5840" y1="2528" y2="2528" x1="5824" />
            <wire x2="6144" y1="2528" y2="2528" x1="5840" />
        </branch>
        <iomarker fontsize="28" x="912" y="2528" name="D" orien="R180" />
        <iomarker fontsize="28" x="912" y="2592" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="6144" y="2528" name="Q" orien="R0" />
    </sheet>
</drawing>