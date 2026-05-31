<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <style>
        /* ========================================
        HOME - THÈME ROUGE BACK-OFFICE
        ======================================== */
    
        /* PAGE TITLE */
        .home-title {
            font-size: 26px;
            font-weight: 700;
            color: #c62828;
            margin-bottom: 5px;
            padding-bottom: 15px;
            border-bottom: 3px solid #c62828;
            margin-bottom: 25px;
        }
    
        .home-welcome {
            color: #666;
            font-size: 15px;
            margin-bottom: 25px;
        }
    
        /* STATS */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin: 0 0 25px 0;
        }
    
        .stat-card {
            background: linear-gradient(135deg, #c62828 0%, #d32f2f 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(198, 40, 40, 0.25);
            transition: transform 0.3s;
        }
    
        .stat-card:hover {
            transform: translateY(-3px);
        }
    
        .stat-card:nth-child(2) {
            background: linear-gradient(135deg, #b71c1c 0%, #c62828 100%);
        }
    
        .stat-card:nth-child(3) {
            background: linear-gradient(135deg, #8d1515 0%, #b71c1c 100%);
        }
    
        .stat-card:nth-child(4) {
            background: linear-gradient(135deg, #6d1010 0%, #8d1515 100%);
        }
    
        .stat-number {
            font-size: 36px;
            font-weight: bold;
            margin: 8px 0;
        }
    
        .stat-label {
            font-size: 13px;
            opacity: 0.9;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
    
        /* FILTRE */
        .filter-section {
            background: white;
            padding: 18px 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            border: 1px solid #f0f0f0;
        }
    
        .filter-section label {
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
    
        .filter-section select {
            padding: 9px 14px;
            border: 2px solid #e0e0e0;
            border-radius: 7px;
            font-size: 14px;
            transition: border-color 0.3s;
            background: white;
        }
    
        .filter-section select:focus {
            outline: none;
            border-color: #c62828;
        }
    
        .filter-section button {
            padding: 9px 22px;
            background: linear-gradient(135deg, #c62828 0%, #d32f2f 100%);
            color: white;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: 0 2px 8px rgba(198,40,40,0.25);
        }
    
        .filter-section button:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(198,40,40,0.35);
        }
    
        .filter-section .btn-reset {
            background: #757575;
            box-shadow: none;
        }
    
        .filter-section .btn-reset:hover {
            background: #616161;
        }
    
        /* INFO MONITEUR SÉLECTIONNÉ */
        .moniteur-info {
            background: #ffebee;
            border: 1px solid #ef9a9a;
            border-left: 4px solid #c62828;
            padding: 10px 15px;
            border-radius: 7px;
            margin-bottom: 15px;
            font-weight: 600;
            color: #c62828;
        }
    
        /* DASHBOARD LAYOUT */
        .dashboard {
            display: flex;
            gap: 20px;
            margin: 0;
        }
    
        /* CALENDRIER */
        .calendar-section {
            flex: 2;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            border: 1px solid #f0f0f0;
        }
    
        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
    
        .calendar-nav {
            display: flex;
            gap: 8px;
        }
    
        .btn-nav {
            padding: 8px 16px;
            background: linear-gradient(135deg, #c62828 0%, #d32f2f 100%);
            color: white;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.3s;
        }
    
        .btn-nav:hover {
            transform: translateY(-1px);
            box-shadow: 0 3px 10px rgba(198,40,40,0.3);
            color: white;
            text-decoration: none;
        }
    
        .calendar-title {
            font-size: 22px;
            font-weight: bold;
            color: #c62828;
        }
    
        /* LÉGENDE */
        .legend {
            display: flex;
            gap: 20px;
            margin: 15px 0;
            font-size: 13px;
            padding: 10px 15px;
            background: #fafafa;
            border-radius: 7px;
            border: 1px solid #f0f0f0;
        }
    
        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
    
        .legend-color {
            width: 18px;
            height: 18px;
            border-radius: 4px;
        }
    
        /* GRILLE CALENDRIER */
        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 4px;
            margin-top: 15px;
        }
    
        .calendar-day-header {
            text-align: center;
            font-weight: 700;
            padding: 10px 5px;
            background: linear-gradient(135deg, #c62828 0%, #d32f2f 100%);
            color: white;
            border-radius: 6px;
            font-size: 13px;
        }
    
        .calendar-day {
            min-height: 90px;
            border: 1px solid #eeeeee;
            padding: 5px;
            background: white;
            border-radius: 6px;
            position: relative;
            transition: background 0.2s;
        }
    
        .calendar-day:hover {
            background: #fff5f5;
        }
    
        .calendar-day.other-month {
            background: #fafafa;
            color: #bbb;
        }
    
        .calendar-day.today {
            background: #fff5f5;
            border: 2px solid #c62828;
        }
    
        .day-number {
            font-weight: 700;
            margin-bottom: 4px;
            font-size: 13px;
            color: #444;
        }
    
        .calendar-day.today .day-number {
            color: #c62828;
        }
    
        /* ÉVÉNEMENTS */
        .event-item {
            font-size: 10px;
            padding: 3px 5px;
            margin: 2px 0;
            border-radius: 4px;
            cursor: pointer;
            overflow: hidden;
            line-height: 1.3;
        }
    
        .event-lecon {
            background: #ffebee;
            color: #c62828;
            border-left: 3px solid #c62828;
        }
    
        .event-examen {
            background: #b71c1c;
            color: white;
            font-weight: bold;
        }
    
        .event-time {
            font-weight: bold;
            display: block;
        }
    
        .event-name {
            display: block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    
        /* PROCHAINS ÉVÉNEMENTS */
        .upcoming-section {
            flex: 1;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            max-height: 620px;
            overflow-y: auto;
            border: 1px solid #f0f0f0;
        }
    
        .upcoming-section h3 {
            color: #c62828;
            font-size: 17px;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #c62828;
        }
    
        .upcoming-item {
            padding: 12px;
            margin: 8px 0;
            border-left: 4px solid #c62828;
            background: #ffebee;
            border-radius: 6px;
            transition: transform 0.2s;
        }
    
        .upcoming-item:hover {
            transform: translateX(3px);
        }
    
        .upcoming-item.examen {
            background: #fff5f5;
            border-left-color: #8d1515;
        }
    
        .upcoming-date {
            font-weight: bold;
            color: #c62828;
            font-size: 13px;
            margin-bottom: 4px;
        }
    
        .upcoming-title {
            font-weight: bold;
            margin-bottom: 3px;
            color: #333;
            font-size: 14px;
        }
    
        .upcoming-details {
            font-size: 12px;
            color: #777;
        }
    
        /* SCROLLBAR personnalisée */
        .upcoming-section::-webkit-scrollbar {
            width: 5px;
        }
    
        .upcoming-section::-webkit-scrollbar-track {
            background: #f5f5f5;
        }
    
        .upcoming-section::-webkit-scrollbar-thumb {
            background: #c62828;
            border-radius: 10px;
        }
    
        /* RESPONSIVE */
        @media (max-width: 900px) {
            .dashboard {
                flex-direction: column;
            }
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>

<h1>Tableau de bord</h1><br>

<?php
$nbCandidats = count($unControleur->selectAll_candidats());
$nbMoniteurs = count($unControleur->selectAll_moniteurs());
$nbVehicules = count($unControleur->selectAll_vehicules());
$nbLeconsSemaine = count($unControleur->selectEvenements_prochains(7));
?>

<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-label">Candidats inscrits</div>
        <div class="stat-number"><?php echo $nbCandidats; ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Moniteurs</div>
        <div class="stat-number"><?php echo $nbMoniteurs; ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Véhicules</div>
        <div class="stat-number"><?php echo $nbVehicules; ?></div>
    </div>
    <div class="stat-card">
        <div class="stat-label">Événements cette semaine</div>
        <div class="stat-number"><?php echo $nbLeconsSemaine; ?></div>
    </div>
</div>

<div class="filter-section">
    <form method="get" style="display: inline;">
        <input type="hidden" name="page" value="1">
        <label for="moniteur">Filtrer par moniteur :</label>
        <select name="moniteur" id="moniteur">
            <option value="">-- Tous les moniteurs --</option>
            <?php
                $lesMoniteurs = $unControleur->selectAll_moniteurs();
                foreach ($lesMoniteurs as $unMoniteur) {
                    $selected = (isset($_GET['moniteur']) && $_GET['moniteur'] == $unMoniteur['id_moniteur']) ? 'selected' : '';
                    echo "<option value='".$unMoniteur['id_moniteur']."' $selected>";
                    echo $unMoniteur['nomM'].' '.$unMoniteur['prenomM'];
                    echo "</option>";
                }
            ?>
        </select>
        <button type="submit">Filtrer</button>
        <?php if (isset($_GET['moniteur']) && $_GET['moniteur'] != ''): ?>
            <a href="?page=1"><button type="button" class="btn-reset">Réinitialiser</button></a>
        <?php endif; ?>
    </form>
</div>

<?php
if (isset($_GET['moniteur']) && $_GET['moniteur'] != '') {
    $moniteurSelectionne = $unControleur->selectWhere_moniteur($_GET['moniteur']);
    echo '<div class="moniteur-info">';
    echo 'Planning de : '.$moniteurSelectionne['nomM'].' '.$moniteurSelectionne['prenomM'];
    echo '</div>';
}
?>

<div class="dashboard">
    <div class="calendar-section">
        <?php
        $mois = isset($_GET['mois']) ? intval($_GET['mois']) : intval(date('m'));
        $annee = isset($_GET['annee']) ? intval($_GET['annee']) : intval(date('Y'));
        $moniteurFiltre = isset($_GET['moniteur']) ? $_GET['moniteur'] : '';
        
        $moisPrec = $mois - 1;
        $anneePrec = $annee;
        if ($moisPrec < 1) {
            $moisPrec = 12;
            $anneePrec--;
        }
        
        $moisSuiv = $mois + 1;
        $anneeSuiv = $annee;
        if ($moisSuiv > 12) {
            $moisSuiv = 1;
            $anneeSuiv++;
        }
        
        $urlParams = "page=1&mois=%d&annee=%d";
        if ($moniteurFiltre != '') {
            $urlParams .= "&moniteur=$moniteurFiltre";
        }
        
        if ($moniteurFiltre != '') {
            $evenements = $unControleur->selectEvenements_byMoniteurAndMonth($moniteurFiltre, $annee, $mois);
        } else {
            $evenements = $unControleur->selectEvenements_byMonth($annee, $mois);
        }
        
        $evenementsParJour = array();
        foreach ($evenements as $evt) {
            $jour = intval(date('j', strtotime($evt['date_evenement'])));
            if (!isset($evenementsParJour[$jour])) {
                $evenementsParJour[$jour] = array();
            }
            $evenementsParJour[$jour][] = $evt;
        }
        
        $nomsMois = array('', 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 
                          'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre');
        $premierJour = mktime(0, 0, 0, $mois, 1, $annee);
        $nbJours = date('t', $premierJour);
        $jourSemaine = date('N', $premierJour);
        ?>
        
        <div class="calendar-header">
            <div class="calendar-nav">
                <a href="?<?php echo sprintf($urlParams, $moisPrec, $anneePrec); ?>" class="btn-nav">◄ Précédent</a>
                <a href="?page=1<?php echo $moniteurFiltre ? '&moniteur='.$moniteurFiltre : ''; ?>" class="btn-nav">Aujourd'hui</a>
                <a href="?<?php echo sprintf($urlParams, $moisSuiv, $anneeSuiv); ?>" class="btn-nav">Suivant ►</a>
            </div>
            <div class="calendar-title"><?php echo $nomsMois[$mois] . ' ' . $annee; ?></div>
        </div>
        
        <div class="legend">
            <div class="legend-item">
                <div class="legend-color" style="background: #bbdefb;"></div>
                <span>Leçon de conduite</span>
            </div>
            <div class="legend-item">
                <div class="legend-color" style="background: #ffccbc;"></div>
                <span>Examen</span>
            </div>
        </div>
        
        <div class="calendar-grid">
            <div class="calendar-day-header">Lun</div>
            <div class="calendar-day-header">Mar</div>
            <div class="calendar-day-header">Mer</div>
            <div class="calendar-day-header">Jeu</div>
            <div class="calendar-day-header">Ven</div>
            <div class="calendar-day-header">Sam</div>
            <div class="calendar-day-header">Dim</div>
            
            <?php
            for ($i = 1; $i < $jourSemaine; $i++) {
                echo '<div class="calendar-day other-month"></div>';
            }
            
            $aujourdhui = intval(date('j'));
            $moisCourant = intval(date('m'));
            $anneeCourante = intval(date('Y'));
            
            for ($jour = 1; $jour <= $nbJours; $jour++) {
                $isToday = ($jour == $aujourdhui && $mois == $moisCourant && $annee == $anneeCourante);
                $classe = $isToday ? 'calendar-day today' : 'calendar-day';
                
                echo '<div class="' . $classe . '">';
                echo '<div class="day-number">' . $jour . '</div>';
                
                if (isset($evenementsParJour[$jour])) {
                    foreach ($evenementsParJour[$jour] as $evt) {
                        $classeEvent = ($evt['type_evenement'] == 'lecon') ? 'event-lecon' : 'event-examen';
                        $heure = date('H:i', strtotime($evt['date_evenement']));
                        
                        $nom = isset($evt['nom_candidat']) ? $evt['nom_candidat'] : '';
                        $prenom = isset($evt['prenom_candidat']) ? $evt['prenom_candidat'] : '';
                        
                        if (strlen($nom) > 8) {
                            $affichage = $prenom;
                        } else {
                            $affichage = $nom . ' ' . substr($prenom, 0, 1) . '.';
                        }
                        
                        echo '<div class="event-item ' . $classeEvent . '" title="' . htmlspecialchars($evt['candidat_nom'] . ' - ' . $evt['libelle']) . '">';
                        echo '<span class="event-time">' . $heure . '</span>';
                        echo '<span class="event-name">' . htmlspecialchars($affichage) . '</span>';
                        echo '</div>';
                    }
                }
                
                echo '</div>';
            }
            
            $dernierJourSemaine = date('N', mktime(0, 0, 0, $mois, $nbJours, $annee));
            for ($i = $dernierJourSemaine; $i < 7; $i++) {
                echo '<div class="calendar-day other-month"></div>';
            }
            ?>
        </div>
    </div>
    
    <div class="upcoming-section">
        <h3>Prochains événements (7 jours)</h3>
        
        <?php
        if ($moniteurFiltre != '') {
            $prochains = $unControleur->selectEvenements_prochains_moniteur($moniteurFiltre, 7);
        } else {
            $prochains = $unControleur->selectEvenements_prochains(7);
        }
        
        if (count($prochains) == 0) {
            echo '<p style="color: #999; text-align: center; margin-top: 50px;">Aucun événement prévu dans les 7 prochains jours</p>';
        } else {
            $jourActuel = '';
            $joursFr = array(
                'Monday' => 'Lundi',
                'Tuesday' => 'Mardi',
                'Wednesday' => 'Mercredi',
                'Thursday' => 'Jeudi',
                'Friday' => 'Vendredi',
                'Saturday' => 'Samedi',
                'Sunday' => 'Dimanche'
            );
            $moisFr = array(
                'January' => 'janvier',
                'February' => 'février',
                'March' => 'mars',
                'April' => 'avril',
                'May' => 'mai',
                'June' => 'juin',
                'July' => 'juillet',
                'August' => 'août',
                'September' => 'septembre',
                'October' => 'octobre',
                'November' => 'novembre',
                'December' => 'décembre'
            );
            
            foreach ($prochains as $evt) {
                $timestamp = strtotime($evt['date_evenement']);
                $jourSemaineEn = date('l', $timestamp);
                $numeroJour = date('j', $timestamp);
                $moisEn = date('F', $timestamp);
                $anneeEvt = date('Y', $timestamp);
                
                $jourTraduit = $joursFr[$jourSemaineEn] . ' ' . $numeroJour . ' ' . $moisFr[$moisEn] . ' ' . $anneeEvt;
                
                if ($jourTraduit != $jourActuel) {
                    if ($jourActuel != '') echo '<hr style="margin: 15px 0; border: none; border-top: 1px solid #eee;">';
                    echo '<h4 style="color: #4CAF50; margin: 15px 0 10px 0;">' . $jourTraduit . '</h4>';
                    $jourActuel = $jourTraduit;
                }
                
                $classe = ($evt['type_evenement'] == 'examen') ? 'upcoming-item examen' : 'upcoming-item';
                $icone = ($evt['type_evenement'] == 'examen') ? '📝' : '🚗';
                
                echo '<div class="' . $classe . '">';
                echo '<div class="upcoming-date">' . $icone . ' ' . date('H:i', strtotime($evt['date_evenement']));
                if ($evt['duree_lecon']) {
                    echo ' (' . $evt['duree_lecon'] . ' min)';
                }
                echo '</div>';
                echo '<div class="upcoming-title">' . htmlspecialchars($evt['candidat_nom']) . '</div>';
                echo '<div class="upcoming-details">';
                echo $evt['libelle'];
                if ($evt['moniteur_nom']) {
                    echo ' - Moniteur : ' . htmlspecialchars($evt['moniteur_nom']);
                }
                if ($evt['vehicule_info'] && $evt['type_evenement'] == 'lecon') {
                    echo '<br>Véhicule : ' . htmlspecialchars($evt['vehicule_info']);
                }
                if ($evt['vehicule_info'] && $evt['type_evenement'] == 'examen') {
                    echo '<br>Lieu : ' . htmlspecialchars($evt['vehicule_info']);
                }
                echo '</div>';
                echo '</div>';
            }
        }
        ?>
    </div>
</div>

</body>
</html>