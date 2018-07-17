<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="tri_in1" />
        <signal name="tri_in2" />
        <signal name="tri_in3" />
        <signal name="tri_in4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="clk" />
        <signal name="mbed_sel0" />
        <signal name="mbed_sel1" />
        <signal name="XLXN_36" />
        <signal name="input_tri" />
        <signal name="enable_thermal_tri" />
        <signal name="XLXN_56" />
        <signal name="ex_tri" />
        <signal name="force_tri" />
        <signal name="XLXN_66" />
        <signal name="XLXN_67" />
        <signal name="XLXN_69" />
        <port polarity="Input" name="tri_in1" />
        <port polarity="Input" name="tri_in2" />
        <port polarity="Input" name="tri_in3" />
        <port polarity="Input" name="tri_in4" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="mbed_sel0" />
        <port polarity="Input" name="mbed_sel1" />
        <port polarity="Output" name="input_tri" />
        <port polarity="Input" name="enable_thermal_tri" />
        <port polarity="Input" name="ex_tri" />
        <port polarity="Input" name="force_tri" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="or6">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="48" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-320" y2="-320" x1="0" />
            <line x2="48" y1="-384" y2="-384" x1="0" />
            <line x2="192" y1="-224" y2="-224" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <arc ex="112" ey="-272" sx="192" sy="-224" r="88" cx="116" cy="-184" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
            <arc ex="192" ey="-224" sx="112" sy="-176" r="88" cx="116" cy="-264" />
            <arc ex="48" ey="-272" sx="48" sy="-176" r="56" cx="16" cy="-224" />
            <line x2="48" y1="-272" y2="-272" x1="112" />
            <line x2="48" y1="-64" y2="-176" x1="48" />
            <line x2="48" y1="-272" y2="-384" x1="48" />
        </blockdef>
        <blockdef name="demux">
            <timestamp>2011-11-16T22:16:19</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="or4" name="XLXI_12">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in3" name="I1" />
            <blockpin signalname="tri_in2" name="I2" />
            <blockpin signalname="tri_in1" name="I3" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="or6" name="XLXI_13">
            <blockpin signalname="XLXN_12" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_10" name="I2" />
            <blockpin signalname="XLXN_9" name="I3" />
            <blockpin signalname="XLXN_8" name="I4" />
            <blockpin signalname="XLXN_7" name="I5" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_14">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_14" name="I2" />
            <blockpin signalname="XLXN_13" name="I3" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="demux" name="XLXI_21">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="mbed_sel0" name="sel0" />
            <blockpin signalname="mbed_sel1" name="sel1" />
            <blockpin signalname="XLXN_19" name="cout0" />
            <blockpin signalname="XLXN_69" name="cout1" />
            <blockpin signalname="XLXN_21" name="cout2" />
            <blockpin signalname="XLXN_22" name="cout3" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in1" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="tri_in3" name="I0" />
            <blockpin signalname="tri_in2" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in2" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in3" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="tri_in3" name="I0" />
            <blockpin signalname="tri_in1" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="tri_in2" name="I0" />
            <blockpin signalname="tri_in1" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_7">
            <blockpin signalname="tri_in3" name="I0" />
            <blockpin signalname="tri_in2" name="I1" />
            <blockpin signalname="tri_in1" name="I2" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_8">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in2" name="I1" />
            <blockpin signalname="tri_in1" name="I2" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_9">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in3" name="I1" />
            <blockpin signalname="tri_in1" name="I2" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_10">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in3" name="I1" />
            <blockpin signalname="tri_in2" name="I2" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_11">
            <blockpin signalname="tri_in4" name="I0" />
            <blockpin signalname="tri_in3" name="I1" />
            <blockpin signalname="tri_in2" name="I2" />
            <blockpin signalname="tri_in1" name="I3" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_27">
            <blockpin signalname="enable_thermal_tri" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="XLXN_5" name="I2" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_28">
            <blockpin signalname="enable_thermal_tri" name="I0" />
            <blockpin signalname="XLXN_69" name="I1" />
            <blockpin signalname="XLXN_6" name="I2" />
            <blockpin signalname="XLXN_66" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_29">
            <blockpin signalname="enable_thermal_tri" name="I0" />
            <blockpin signalname="XLXN_22" name="I1" />
            <blockpin signalname="XLXN_18" name="I2" />
            <blockpin signalname="XLXN_56" name="O" />
        </block>
        <block symbolname="or6" name="XLXI_26">
            <blockpin signalname="force_tri" name="I0" />
            <blockpin signalname="ex_tri" name="I1" />
            <blockpin signalname="XLXN_56" name="I2" />
            <blockpin signalname="XLXN_36" name="I3" />
            <blockpin signalname="XLXN_66" name="I4" />
            <blockpin signalname="XLXN_23" name="I5" />
            <blockpin signalname="input_tri" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_32">
            <blockpin signalname="enable_thermal_tri" name="I0" />
            <blockpin signalname="XLXN_21" name="I1" />
            <blockpin signalname="XLXN_67" name="I2" />
            <blockpin signalname="XLXN_36" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1456" y="384" name="XLXI_12" orien="R0" />
        <instance x="704" y="2608" name="XLXI_21" orien="R0">
        </instance>
        <instance x="1008" y="800" name="XLXI_3" orien="R0" />
        <instance x="1008" y="928" name="XLXI_4" orien="R0" />
        <instance x="1008" y="1056" name="XLXI_5" orien="R0" />
        <instance x="1008" y="1184" name="XLXI_6" orien="R0" />
        <instance x="1008" y="672" name="XLXI_2" orien="R0" />
        <instance x="1008" y="544" name="XLXI_1" orien="R0" />
        <instance x="1008" y="1392" name="XLXI_7" orien="R0" />
        <instance x="1008" y="1568" name="XLXI_8" orien="R0" />
        <instance x="1008" y="1744" name="XLXI_9" orien="R0" />
        <instance x="1008" y="1920" name="XLXI_10" orien="R0" />
        <instance x="1008" y="2192" name="XLXI_11" orien="R0" />
        <branch name="tri_in1">
            <wire x2="464" y1="128" y2="128" x1="400" />
            <wire x2="464" y1="128" y2="416" x1="464" />
            <wire x2="1008" y1="416" y2="416" x1="464" />
            <wire x2="464" y1="416" y2="544" x1="464" />
            <wire x2="1008" y1="544" y2="544" x1="464" />
            <wire x2="464" y1="544" y2="672" x1="464" />
            <wire x2="1008" y1="672" y2="672" x1="464" />
            <wire x2="464" y1="672" y2="1200" x1="464" />
            <wire x2="1008" y1="1200" y2="1200" x1="464" />
            <wire x2="464" y1="1200" y2="1376" x1="464" />
            <wire x2="1008" y1="1376" y2="1376" x1="464" />
            <wire x2="464" y1="1376" y2="1552" x1="464" />
            <wire x2="464" y1="1552" y2="1936" x1="464" />
            <wire x2="1008" y1="1936" y2="1936" x1="464" />
            <wire x2="1008" y1="1552" y2="1552" x1="464" />
            <wire x2="1456" y1="128" y2="128" x1="464" />
        </branch>
        <branch name="tri_in3">
            <wire x2="576" y1="256" y2="256" x1="400" />
            <wire x2="576" y1="256" y2="608" x1="576" />
            <wire x2="1008" y1="608" y2="608" x1="576" />
            <wire x2="576" y1="608" y2="864" x1="576" />
            <wire x2="1008" y1="864" y2="864" x1="576" />
            <wire x2="576" y1="864" y2="1056" x1="576" />
            <wire x2="1008" y1="1056" y2="1056" x1="576" />
            <wire x2="576" y1="1056" y2="1328" x1="576" />
            <wire x2="1008" y1="1328" y2="1328" x1="576" />
            <wire x2="576" y1="1328" y2="1616" x1="576" />
            <wire x2="1008" y1="1616" y2="1616" x1="576" />
            <wire x2="576" y1="1616" y2="1792" x1="576" />
            <wire x2="576" y1="1792" y2="2064" x1="576" />
            <wire x2="1008" y1="2064" y2="2064" x1="576" />
            <wire x2="1008" y1="1792" y2="1792" x1="576" />
            <wire x2="1456" y1="256" y2="256" x1="576" />
        </branch>
        <branch name="tri_in4">
            <wire x2="640" y1="320" y2="320" x1="400" />
            <wire x2="640" y1="320" y2="736" x1="640" />
            <wire x2="1008" y1="736" y2="736" x1="640" />
            <wire x2="640" y1="736" y2="992" x1="640" />
            <wire x2="1008" y1="992" y2="992" x1="640" />
            <wire x2="640" y1="992" y2="1120" x1="640" />
            <wire x2="1008" y1="1120" y2="1120" x1="640" />
            <wire x2="640" y1="1120" y2="1504" x1="640" />
            <wire x2="1008" y1="1504" y2="1504" x1="640" />
            <wire x2="640" y1="1504" y2="1680" x1="640" />
            <wire x2="1008" y1="1680" y2="1680" x1="640" />
            <wire x2="640" y1="1680" y2="1856" x1="640" />
            <wire x2="640" y1="1856" y2="2128" x1="640" />
            <wire x2="1008" y1="2128" y2="2128" x1="640" />
            <wire x2="1008" y1="1856" y2="1856" x1="640" />
            <wire x2="1456" y1="320" y2="320" x1="640" />
        </branch>
        <instance x="1568" y="960" name="XLXI_13" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="1568" y1="448" y2="448" x1="1264" />
            <wire x2="1568" y1="448" y2="576" x1="1568" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1408" y1="576" y2="576" x1="1264" />
            <wire x2="1408" y1="576" y2="640" x1="1408" />
            <wire x2="1568" y1="640" y2="640" x1="1408" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1568" y1="704" y2="704" x1="1264" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1408" y1="832" y2="832" x1="1264" />
            <wire x2="1408" y1="768" y2="832" x1="1408" />
            <wire x2="1568" y1="768" y2="768" x1="1408" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1424" y1="960" y2="960" x1="1264" />
            <wire x2="1424" y1="832" y2="960" x1="1424" />
            <wire x2="1568" y1="832" y2="832" x1="1424" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1568" y1="1088" y2="1088" x1="1264" />
            <wire x2="1568" y1="896" y2="1088" x1="1568" />
        </branch>
        <instance x="1568" y="1680" name="XLXI_14" orien="R0" />
        <branch name="XLXN_13">
            <wire x2="1568" y1="1264" y2="1264" x1="1264" />
            <wire x2="1568" y1="1264" y2="1424" x1="1568" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1408" y1="1440" y2="1440" x1="1264" />
            <wire x2="1408" y1="1440" y2="1488" x1="1408" />
            <wire x2="1568" y1="1488" y2="1488" x1="1408" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1408" y1="1616" y2="1616" x1="1264" />
            <wire x2="1408" y1="1552" y2="1616" x1="1408" />
            <wire x2="1568" y1="1552" y2="1552" x1="1408" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1568" y1="1792" y2="1792" x1="1264" />
            <wire x2="1568" y1="1616" y2="1792" x1="1568" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="1856" y1="2512" y2="2512" x1="1088" />
            <wire x2="1856" y1="1584" y2="2512" x1="1856" />
            <wire x2="2032" y1="1584" y2="1584" x1="1856" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="2880" y1="288" y2="288" x1="2320" />
            <wire x2="2880" y1="288" y2="1008" x1="2880" />
            <wire x2="3056" y1="1008" y2="1008" x1="2880" />
        </branch>
        <iomarker fontsize="28" x="400" y="128" name="tri_in1" orien="R180" />
        <iomarker fontsize="28" x="400" y="192" name="tri_in2" orien="R180" />
        <iomarker fontsize="28" x="400" y="256" name="tri_in3" orien="R180" />
        <iomarker fontsize="28" x="400" y="320" name="tri_in4" orien="R180" />
        <branch name="tri_in2">
            <wire x2="512" y1="192" y2="192" x1="400" />
            <wire x2="1456" y1="192" y2="192" x1="512" />
            <wire x2="512" y1="192" y2="480" x1="512" />
            <wire x2="1008" y1="480" y2="480" x1="512" />
            <wire x2="512" y1="480" y2="800" x1="512" />
            <wire x2="1008" y1="800" y2="800" x1="512" />
            <wire x2="512" y1="800" y2="928" x1="512" />
            <wire x2="1008" y1="928" y2="928" x1="512" />
            <wire x2="512" y1="928" y2="1264" x1="512" />
            <wire x2="1008" y1="1264" y2="1264" x1="512" />
            <wire x2="512" y1="1264" y2="1440" x1="512" />
            <wire x2="1008" y1="1440" y2="1440" x1="512" />
            <wire x2="512" y1="1440" y2="1728" x1="512" />
            <wire x2="512" y1="1728" y2="2000" x1="512" />
            <wire x2="1008" y1="2000" y2="2000" x1="512" />
            <wire x2="1008" y1="1728" y2="1728" x1="512" />
        </branch>
        <branch name="clk">
            <wire x2="704" y1="2384" y2="2384" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="2384" name="clk" orien="R180" />
        <branch name="mbed_sel0">
            <wire x2="704" y1="2480" y2="2480" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="2480" name="mbed_sel0" orien="R180" />
        <branch name="mbed_sel1">
            <wire x2="704" y1="2576" y2="2576" x1="672" />
        </branch>
        <iomarker fontsize="28" x="672" y="2576" name="mbed_sel1" orien="R180" />
        <branch name="XLXN_6">
            <wire x2="2064" y1="736" y2="736" x1="1824" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="2032" y1="1520" y2="1520" x1="1824" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="2016" y1="2032" y2="2032" x1="1264" />
        </branch>
        <branch name="input_tri">
            <wire x2="3344" y1="1168" y2="1168" x1="3312" />
        </branch>
        <branch name="enable_thermal_tri">
            <wire x2="2000" y1="2560" y2="2560" x1="1872" />
            <wire x2="2064" y1="352" y2="352" x1="2000" />
            <wire x2="2000" y1="352" y2="864" x1="2000" />
            <wire x2="2064" y1="864" y2="864" x1="2000" />
            <wire x2="2000" y1="864" y2="1648" x1="2000" />
            <wire x2="2032" y1="1648" y2="1648" x1="2000" />
            <wire x2="2000" y1="1648" y2="2160" x1="2000" />
            <wire x2="2000" y1="2160" y2="2560" x1="2000" />
            <wire x2="2016" y1="2160" y2="2160" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="1872" y="2560" name="enable_thermal_tri" orien="R180" />
        <instance x="2064" y="416" name="XLXI_27" orien="R0" />
        <branch name="ex_tri">
            <wire x2="3040" y1="1264" y2="1264" x1="2880" />
            <wire x2="3056" y1="1264" y2="1264" x1="3040" />
        </branch>
        <branch name="force_tri">
            <wire x2="3040" y1="1328" y2="1328" x1="2912" />
            <wire x2="3056" y1="1328" y2="1328" x1="3040" />
        </branch>
        <instance x="3056" y="1392" name="XLXI_26" orien="R0" />
        <branch name="XLXN_56">
            <wire x2="2528" y1="2096" y2="2096" x1="2272" />
            <wire x2="2528" y1="1200" y2="2096" x1="2528" />
            <wire x2="3056" y1="1200" y2="1200" x1="2528" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="2384" y1="1584" y2="1584" x1="2288" />
            <wire x2="3056" y1="1136" y2="1136" x1="2384" />
            <wire x2="2384" y1="1136" y2="1584" x1="2384" />
        </branch>
        <iomarker fontsize="28" x="3344" y="1168" name="input_tri" orien="R0" />
        <branch name="XLXN_22">
            <wire x2="1552" y1="2576" y2="2576" x1="1088" />
            <wire x2="1552" y1="2096" y2="2576" x1="1552" />
            <wire x2="2016" y1="2096" y2="2096" x1="1552" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="1920" y1="2384" y2="2384" x1="1088" />
            <wire x2="1920" y1="288" y2="2384" x1="1920" />
            <wire x2="2064" y1="288" y2="288" x1="1920" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2064" y1="224" y2="224" x1="1712" />
        </branch>
        <instance x="2016" y="2224" name="XLXI_29" orien="R0" />
        <instance x="2064" y="928" name="XLXI_28" orien="R0" />
        <branch name="XLXN_66">
            <wire x2="2688" y1="800" y2="800" x1="2320" />
            <wire x2="2688" y1="800" y2="1072" x1="2688" />
            <wire x2="3056" y1="1072" y2="1072" x1="2688" />
        </branch>
        <instance x="2032" y="1712" name="XLXI_32" orien="R0" />
        <iomarker fontsize="28" x="2912" y="1328" name="force_tri" orien="R180" />
        <iomarker fontsize="28" x="2880" y="1264" name="ex_tri" orien="R180" />
        <branch name="XLXN_69">
            <wire x2="1936" y1="2448" y2="2448" x1="1088" />
            <wire x2="1936" y1="800" y2="2448" x1="1936" />
            <wire x2="2064" y1="800" y2="800" x1="1936" />
        </branch>
    </sheet>
</drawing>