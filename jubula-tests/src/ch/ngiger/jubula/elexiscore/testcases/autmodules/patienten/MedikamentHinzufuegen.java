package ch.ngiger.jubula.elexiscore.testcases.autmodules.patienten;

import org.eclipse.jubula.client.AUT;
import org.eclipse.jubula.client.api.converter.annotations.NodeType;
import org.eclipse.jubula.client.api.converter.annotations.SrcNode;
import org.eclipse.jubula.qa.api.converter.target.rcp.RuntimeContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ngiger.jubula.elexiscore.testcases.autmodules.helpers.SlowDown_Necessary;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedClick;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.SynchronizedReplaceText;
import ch.ngiger.jubula.elexiscore.testcases.unboundmodules.Ub_grc_drop;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.click.Ub_grc_clickLeft_single;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.dragdrop.table.Ub_tbl_dragCell;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.tabbedcomponent.Ub_tbc_selectTab_byValue;
import ch.ngiger.jubula.unbound_modules_concrete.testcases.actionsbasic.select.table.Ub_tbl_selectCell;

@SrcNode(UUID = "839d2de9e6184841b2bee9277ef18442",
         type = NodeType.TEST_CASE)
public class MedikamentHinzufuegen {

    /** the logger */
    private static Logger log = LoggerFactory.getLogger(MedikamentHinzufuegen.class);

    private RuntimeContext rtc;

    public MedikamentHinzufuegen (RuntimeContext _rtc
    ) {
        rtc = _rtc;
    }

    public void execute(
        String NAME
    ) {
        AUT aut = rtc.getAUT();




        // Click "Verrechnung"
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Kons_Verrechnung_grc")
            ).execute(
            );

        // Select tab "Artikelstamm"
        new Ub_tbc_selectTab_byValue(
                rtc,
                rtc.getIdentifier("CTabFolder_1_tpn")
            ).execute(
                "Artikelstamm"
                ,
                "equals"
            );

        // Leistungsbezeichnung ausfüllen
        new SynchronizedReplaceText(
                rtc,
                rtc.getIdentifier("Leistungen_Bezeichnungs_txt")
            ).execute(
                NAME
            );

        // Refresh Artikel
        new Ub_grc_clickLeft_single(
                rtc,
                rtc.getIdentifier("Artikelstamm_Alle_ToolItem_2_tbi")
            ).execute(
            );

        // Wait Some time
        new SlowDown_Necessary(
                rtc
            ).execute(
            );

        // Select top cell
        new Ub_tbl_selectCell(
                rtc,
                rtc.getIdentifier("Artikelstamm_Alle_Table_1_tbl")
            ).execute(
                "1"
                ,
                "equals"
                ,
                "1"
                ,
                "equals"
                ,
                1
                ,
                50
                ,
                "percent"
                ,
                50
                ,
                "percent"
                ,
                "no"
                ,
                1
            );

        // Drag first cell
        new Ub_tbl_dragCell(
                rtc,
                rtc.getIdentifier("Artikelstamm_Alle_Table_1_tbl")
            ).execute(
                "1"
                ,
                "1"
            );

        // Drop into middle of verrechnung
        new Ub_grc_drop(
                rtc,
                rtc.getIdentifier("Kons_Verrechnung_table")
            ).execute(
                50
                ,
                "percent"
                ,
                50
                ,
                "percent"
                ,
                1000
            );

        // Click again in verrechnung
        new SynchronizedClick(
                rtc,
                rtc.getIdentifier("Kons_Texteingabe_txf")
            ).execute(
            );

        new SlowDown_Necessary(
                rtc
            ).execute(
            );




    }
}