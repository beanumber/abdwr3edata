#' Ripken's Iron Man game log
#' @docType data
#' @format 
#' \describe{
#'   \item{Variable}{Name of the variable}
#'   \item{Value}{Value of the variable}
#' }
#' @seealso [retro_gl_header]
"ripken_gamelog"

#' Warren Spahn Pitching Statistics
#' @docType data
#' @description
#' Season pitching statistics for the Hall of Fame pitcher Warren Spahn
#' 
#' @format 
#'   \describe{
#'     \item{Year}{season}
#'     \item{Age}{age}
#'     \item{Tm}{team}
#'     \item{Lg}{league}
#'     \item{W}{number of wins}
#'     \item{L}{number of losses}
#'     \item{W.L}{winning fraction}
#'     \item{ERA}{earned run average}
#'     \item{G}{games}
#'     \item{GS}{games started}
#'     \item{GF}{games finished}
#'     \item{CG}{complete games}
#'     \item{SHO}{shutouts}
#'     \item{SV}{saves}
#'     \item{IP}{innings pitched}
#'     \item{H}{hits}
#'     \item{R}{runs}
#'     \item{ER}{earned runs}
#'     \item{HR}{home runs allowed}
#'     \item{BB}{walks}
#'     \item{IBB}{intentional walks}
#'     \item{SO}{strikeouts}
#'     \item{HBP}{hit by pitch}
#'     \item{BK}{balks}
#'     \item{WP}{wild pitches}
#'     \item{BF}{batters faced}
#'     \item{ERA.}{earned run average}
#'     \item{WHIP}{walks and hits per nine innings}
#'     \item{H.9}{hits per nine innings}
#'     \item{HR.9}{home runs per nine innings}
#'     \item{BB.9}{walks per nine innings}
#'     \item{SO.9}{strikeouts per nine innings}
#'     \item{SO.BB}{ratio of strikeouts to walks}
#'   }
"spahn"

#' American and National League statistics
#' @description
#' Batting and pitching statistics for all American and National League teams 
#' in the 2011 season.
#' @docType data
#' @format
#' \describe{
#'   \item{Tm}{team abbreviation}
#'   \item{NBat}{number of players}
#'   \item{BatAge}{average age}
#'   \item{R.G}{runs scored per game}
#'   \item{G}{games played}
#'   \item{PA}{plate appearances}
#'   \item{AB}{at-bats}
#'   \item{R}{runs scored}
#'   \item{H}{hits}
#'   \item{X2B}{doubles}
#'   \item{X3B}{triples}
#'   \item{HR}{home runs}
#'   \item{RBI}{runs batted in}
#'   \item{SB}{stolen bases}
#'   \item{CS}{caught stealing}
#'   \item{BB}{walks}
#'   \item{SO}{strikeouts}
#'   \item{BA}{batting average}
#'   \item{OBP}{on-base percentage}
#'   \item{SLG}{slugging percentage}
#'   \item{OPS}{on-base percentage plus slugging percentage}
#'   \item{OPS.}{relative OPS statistic}
#'   \item{TB}{total bases}
#'   \item{GDP}{grounded into double play}
#'   \item{HBP}{hit by pitch}
#'   \item{SH}{sacrifice hits}
#'   \item{SF}{sacrifice flies}
#'   \item{IBB}{intentional walks}
#' }
#' @source Baseball-Reference: <https://www.baseball-reference.com/leagues/NL/2011.shtml>
"NLbatting"
#' @rdname NLbatting
"ALbatting"
#' @rdname NLbatting
#' @format 
#'   \describe{
#'     \item{Tm}{team abbreviation}
#'     \item{NPitch}{number of pitchers}
#'     \item{PitchAge}{average age}
#'     \item{R.G}{runs allowed per game}
#'     \item{W}{wins}
#'     \item{L}{losses}
#'     \item{W.L.}{winning fraction}
#'     \item{ERA}{earned run average}
#'     \item{G}{games played}
#'     \item{GS}{games started}
#'     \item{GF}{games finished}
#'     \item{CG}{complete games}
#'     \item{tmSHO}{team shutouts}
#'     \item{cgSHO}{complete game shutouts}
#'     \item{SV}{saves}
#'     \item{IP}{innings pitched}
#'     \item{H}{hits}
#'     \item{R}{runs allowed}
#'     \item{ER}{earned runs allowed}
#'     \item{HR}{home runs}
#'     \item{BB}{walks}
#'     \item{IBB}{intentional walks}
#'     \item{SO}{strikeouts}
#'     \item{HBP}{hit by pitch}
#'     \item{BK}{balks}
#'     \item{WP}{wild pitches}
#'     \item{BF}{batters faced}
#'     \item{ERA.}{relative ERA}
#'     \item{WHIP}{hits and walks per nine innings}
#'     \item{H.9}{hits per nine innings}
#'     \item{HR.9}{home runs per nine innings}
#'     \item{BB.9}{walks per nine innings}
#'     \item{SO.9}{strikeouts per nine innings}
#'     \item{SO.BB}{ratio of strikeouts to walks}
#'    }
"NLpitching"

#' Hall of Fame Batting and Pitching Statistics
#' @docType data
#' @description
#' Career batting and pitching statistics for players inducted in the 
#' baseball Hall of Fame
#' 
#' @format 
#'   \describe{
#'     \item{Player}{player name}
#'     \item{HR}{career home runs}
#'     \item{AB}{career at-bats}
#'     \item{From}{first season in MLB}
#'     \item{To}{last season in MLB}
#'     \item{OBP}{career on-base percentage}
#'     \item{SLG}{career slugging percentage}
#'     \item{OPS}{career OPS statistic}
#'   }
#' @source Baseball-Reference
#' @seealso [Lahman::HallOfFame]
"hof_batting"
#' @rdname hof_batting
#' @format 
#'   \describe{
#'     \item{Rk}{A ranking number}
#'     \item{X2}{player name}
#'     \item{Inducted}{year inducated in HOF}
#'     \item{Yrs}{length of career}
#'     \item{From}{first year in MLB}
#'     \item{To}{final year in MLB}
#'     \item{ASG}{number of all-star game appearances}
#'     \item{WAR}{career WAR measure}
#'     \item{W}{career wins}
#'     \item{L}{career losses}
#'     \item{W.L.}{winning fraction}
#'     \item{ERA}{career ERA}
#'     \item{G}{career games}
#'     \item{GS}{career games started}
#'     \item{GF}{career games finished}
#'     \item{CG}{complete games}
#'     \item{SHO}{shutouts}
#'     \item{SV}{saves}
#'     \item{IP}{innings pitched}
#'     \item{H}{hits allowed}
#'     \item{R}{runs allowed}
#'     \item{ER}{earned runs allowed}
#'     \item{HR}{home runs allowed}
#'     \item{BB}{walks}
#'     \item{IBB}{intentional walks}
#'     \item{SO}{strikeouts}
#'     \item{HBP}{hit by pitches}
#'     \item{BK}{balks}
#'     \item{WP}{wild pitches}
#'     \item{BF}{batters faced}
#'    }
"hof_pitching"

#' Retrosheet game logs
#' @docType data
#' @description
#' Retrosheet game logs for all games played in the 2011 season
#' 
#' @details
#' For [retro_gl_header], the data frame contains no rows, only the variable names.
#' 
"retro_gl_header"
#' @rdname retro_gl_header
#' @format 
#'   \describe{
#'     \item{Date}{date in the form yyyymmdd}
#'     \item{DoubleHeader}{number of game}
#'     \item{DayOfWeek}{day of week}
#'     \item{VisitingTeam}{visiting team}
#'     \item{VisitingTeamLeague}{visiting league}
#'     \item{VisitingTeamGameNumber}{visiting team game number}
#'     \item{HomeTeam}{home team}
#'     \item{HomeTeamLeague}{home league}
#'     \item{HomeTeamGameNumber}{home team game number}
#'     \item{VisitorRunsScored}{visiting score}
#'     \item{HomeRunsScore}{home score}
#'     \item{LengthInOuts}{length of game in outs}
#'     \item{DayNight}{day/night indicator}
#'     \item{CompletionInfo}{completed game information}
#'     \item{ForfeitInfo}{forfeit game information}
#'     \item{ProtestInfo}{protest information}
#'     \item{ParkID}{park id}
#'     \item{Attendence}{attendance}
#'     \item{Duration}{time of game in minutes}
#'     \item{VisitorLineScore}{visiting team line score}
#'     \item{HomeLineScore}{home team line score}
#'     \item{VisitorAB}{visiting team at-bats}
#'     \item{VisitorH}{visiting team hits}
#'     \item{VisitorD}{visiting team doubles}
#'     \item{VisitorT}{visiting team triples}
#'     \item{VisitorHR}{visiting team home runs}
#'     \item{VisitorRBI}{visiting team runs batted in}
#'     \item{VisitorSH}{visiting team sacrifice hits}
#'     \item{VisitorSF}{visiting team sacrifice flies}
#'     \item{VisitorHBP}{visiting team hit by pitches}
#'     \item{VisitorBB}{visiting team walks}
#'     \item{VisitorIBB}{visiting team intentional walks}
#'     \item{VisitorK}{visiting team strikeouts}
#'     \item{VisitorSB}{visiting team stolen bases}
#'     \item{VisitorCS}{visiting team caught stealing}
#'     \item{VisitorGDP}{visiting team ground in double plays}
#'     \item{VisitorCI}{visiting team awarded first on catcher interference}
#'     \item{VisitorLOB}{visiting team left on base}
#'     \item{VisitorPitchers}{visiting team pitchers used}
#'     \item{VisitorER}{visiting team individual earned runs}
#'     \item{VisitorTER}{visiting team team earned runs}
#'     \item{VisitorWP}{visiting team wild pitches}
#'     \item{VisitorBalks}{visiting team balks}
#'     \item{VisitorPO}{visiting team putouts}
#'     \item{VisitorA}{visiting team assists}
#'     \item{VisitorE}{visiting team errors}
#'     \item{VisitorPassed}{visiting team passed balls}
#'     \item{VisitorDB}{visiting team double plays}
#'     \item{VisitorTP}{visiting team triple plays}
#'     \item{HomeAB}{home team at bats}
#'     \item{HomeH}{home team hits}
#'     \item{HomeD}{home team doubles}
#'     \item{HomeT}{home team triples}
#'     \item{HomeHR}{home team home runs}
#'     \item{HomeRBI}{home team runs batted in}
#'     \item{HomeSH}{home team sacrifice hits}
#'     \item{HomeSF}{home team sacrifice flies}
#'     \item{HomeHBP}{home team hit by pitches}
#'     \item{HomeBB}{home team walks}
#'     \item{HomeIBB}{home team intentional walks}
#'     \item{HomeK}{home team strikeouts}
#'     \item{HomeSB}{home team stolen bases}
#'     \item{HomeCS}{home team caught stealing}
#'     \item{HomeGDP}{home team ground in double plays}
#'     \item{HomeCI}{home team awarded first on catcher interference}
#'     \item{HomeLOB}{home team left on base}
#'     \item{HomePitchers}{home team number of pitchers}
#'     \item{HomeER}{home team individual earned runs}
#'     \item{HomeTER}{home team team earned runs}
#'     \item{HomeWP}{home team wild pitches}
#'     \item{HomeBalks}{home team balks}
#'     \item{HomePO}{home team putouts}
#'     \item{HomeA}{home team assists}
#'     \item{HomeE}{home team errors}
#'     \item{HomePassed}{home team passed balls}
#'     \item{HomeDB}{home team double plays}
#'     \item{HomeTP}{home team triple plays}
#'     \item{UmpireHID}{home plate umpire id}
#'     \item{UmpireHName}{home plate umpire name}
#'     \item{Umpire1BID}{1st base umpire id}
#'     \item{Umpire1BName}{1st base umpire name}
#'     \item{Umpire2BID}{2nd base umpire id}
#'     \item{Umpire2BName}{2nd base umpire name}
#'     \item{Umpire3BID}{3rd base umpire id}
#'     \item{Umpire3BName}{3rd base umpire name}
#'     \item{UmpireLFID}{LF umpire id}
#'     \item{UmpireLFName}{LF umpire name}
#'     \item{UmpireRFID}{RF umpire id}
#'     \item{UmpireRFName}{RF umpire name}
#'     \item{VisitorManagerID}{visiting manager id}
#'     \item{VisitorManagerName}{visiting manager name}
#'     \item{HomeManagerID}{home manager id}
#'     \item{HomeManagerName}{home manager name}
#'     \item{WinningPitcherID}{winning pitcher id}
#'     \item{WinningPitcherName}{winning pitcher name}
#'     \item{LosingPitcherID}{losing pitcher id}
#'     \item{LosingPitcherNAme}{losing pitcher name}
#'     \item{SavingPitcherID}{saving pitcher id}
#'     \item{SavingPitcherName}{saving pitcher name}
#'     \item{GameWinningRBIID}{id of player with the winning RBI}
#'     \item{GameWinningRBIName}{name of player with the winning RBI}
#'     \item{VisitorStartingPitcherID}{visiting starting pitcher id}
#'     \item{VisitorStartingPitcherName}{visiting starting pitcher name}
#'     \item{HomeStartingPitcherID}{home starting pitcher id}
#'     \item{HomeStartingPitcherName}{home starting pitcher name}
#'     \item{VisitorBatting1PlayerID}{visiting batting 1st id}
#'     \item{VisitorBatting1Name}{visiting batting 1st name}
#'     \item{VisitorBatting1Position}{visiting batting 1st position}
#'     \item{VisitorBatting2PlayerID}{visiting batting 2nd name}
#'     \item{VisitorBatting2Name}{visiting batting 2nd id}
#'     \item{VisitorBatting2Position}{visiting batting 2nd position}
#'     \item{VisitorBatting3PlayerID}{visiting batting 3rd id}
#'     \item{VisitorBatting3Name}{visiting batting 3rd name}
#'     \item{VisitorBatting3Position}{visiting batting 3rd position}
#'     \item{VisitorBatting4PlayerID}{visiting batting 4th id}
#'     \item{VisitorBatting4Name}{visiting batting 4th name}
#'     \item{VisitorBatting4Position}{visiting batting 4th position}
#'     \item{VisitorBatting5PlayerID}{visiting batting 5th id}
#'     \item{VisitorBatting5Name}{visiting batting 5th name}
#'     \item{VisitorBatting5Position}{visiting batting 5th position}
#'     \item{VisitorBatting6PlayerID}{visiting batting 6th id}
#'     \item{VisitorBatting6Name}{visiting batting 6th name}
#'     \item{VisitorBatting6Position}{visiting batting 6th position}
#'     \item{VisitorBatting7PlayerID}{visiting batting 7th id}
#'     \item{VisitorBatting7Name}{visiting batting 7th name}
#'     \item{VisitorBatting7Position}{visiting batting 7th position}
#'     \item{VisitorBatting8PlayerID}{visiting batting 8th id}
#'     \item{VisitorBatting8Name}{visiting batting 8th name}
#'     \item{VisitorBatting8Position}{visiting batting 8th position}
#'     \item{VisitorBatting9PlayerID}{visiting batting 9th id}
#'     \item{VisitorBatting9Name}{visiting batting 9th name}
#'     \item{VisitorBatting9Position}{visiting batting 9th position}
#'     \item{HomeBatting1PlayerID}{home batting 1st id}
#'     \item{HomeBatting1Name}{home batting 1st name}
#'     \item{HomeBatting1Position}{home batting 1st position}
#'     \item{HomeBatting2PlayerID}{home batting 2nd id}
#'     \item{HomeBatting2Name}{home batting 2nd name}
#'     \item{HomeBatting2Position}{home batting 2nd position}
#'     \item{HomeBatting3PlayerID}{home batting 3rd id}
#'     \item{HomeBatting3Name}{home batting 3rd name}
#'     \item{HomeBatting3Position}{home batting 3rd position}
#'     \item{HomeBatting4PlayerID}{home batting 4th id}
#'     \item{HomeBatting4Name}{home batting 4th name}
#'     \item{HomeBatting4Position}{home batting 4th position}
#'     \item{HomeBatting5PlayerID}{home batting 5th id}
#'     \item{HomeBatting5Name}{home batting 5th name}
#'     \item{HomeBatting5Position}{home batting 5th position}
#'     \item{HomeBatting6PlayerID}{home batting 6th id}
#'     \item{HomeBatting6Name}{home batting 6th name}
#'     \item{HomeBatting6Position}{home batting 6th position}
#'     \item{HomeBatting7PlayerID}{home batting 7th id}
#'     \item{HomeBatting7Name}{home batting 7th name}
#'     \item{HomeBatting7Position}{home batting 7th position}
#'     \item{HomeBatting8PlayerID}{home batting 8th id}
#'     \item{HomeBatting8Name}{home batting 8th name}
#'     \item{HomeBatting8Position}{home batting 8th position}
#'     \item{HomeBatting9PlayerID}{home batting 9th id}
#'     \item{HomeBatting9Name}{home batting 9th name}
#'     \item{HomeBatting9Position}{home batting 9th position}
#'     \item{AdditionalInfo}{additional information}
#'     \item{AcquisitionInfo}{acquisition information}
#'   }
"retro_gl_2011"

#' Retrosheet events data for 2016
#' @docType data
#' @description
#' Retrosheet play-by-play data for complete 2016 season
#' @format 
#'   \describe{
#'     \item{GAME_ID}{game id}
#'     \item{AWAY_TEAM_ID}{visiting team}
#'     \item{INN_CT}{inning}
#'     \item{BAT_HOME_ID}{batting team}
#'     \item{OUTS_CT}{outs}
#'     \item{BALLS_CT}{balls}
#'     \item{STRIKES_CT}{strikes}
#'     \item{PITCH_SEQ_TX}{pitch sequence}
#'     \item{AWAY_SCORE_CT}{vis score}
#'     \item{HOME_SCORE_CT}{home score}
#'     \item{BAT_ID}{batter}
#'     \item{BAT_HAND_CD}{batter hand}
#'     \item{RESP_BAT_ID}{res batter}
#'     \item{RESP_BAT_HAND_CD}{res batter hand}
#'     \item{PIT_ID}{pitcher}
#'     \item{PIT_HAND_CD}{pitcher hand}
#'     \item{RESP_PIT_ID}{res pitcher}
#'     \item{RESP_PIT_HAND_CD}{res pitcher hand}
#'     \item{POS2_FLD_ID}{catcher}
#'     \item{POS3_FLD_ID}{first base}
#'     \item{POS4_FLD_ID}{second base}
#'     \item{POS5_FLD_ID}{third base}
#'     \item{POS6_FLD_ID}{shortstop}
#'     \item{POS7_FLD_ID}{left field}
#'     \item{POS8_FLD_ID}{center field}
#'     \item{POS9_FLD_ID}{right field}
#'     \item{BASE1_RUN_ID}{first runner}
#'     \item{BASE2_RUN_ID}{second runner}
#'     \item{BASE3_RUN_ID}{third runner}
#'     \item{EVENT_TX}{event text}
#'     \item{LEADOFF_FL}{leadoff flag}
#'     \item{PH_FL}{pinchhit flag}
#'     \item{BAT_FLD_CD}{defensive position}
#'     \item{BAT_LINEUP_ID}{lineup position}
#'     \item{EVENT_CD}{event type}
#'     \item{BAT_EVENT_FL}{batter event flag}
#'     \item{AB_FL}{ab flag}
#'     \item{H_FL}{hit value}
#'     \item{SH_FL}{SH flag}
#'     \item{SF_FL}{SF flag}
#'     \item{EVENT_OUTS_CT}{outs on play}
#'     \item{DP_FL}{double play flag}
#'     \item{TP_FL}{triple play flag}
#'     \item{RBI_CT}{RBI on play}
#'     \item{WP_FL}{wild pitch flag}
#'     \item{PB_FL}{passed ball flag}
#'     \item{FLD_CD}{fielded by}
#'     \item{BATTEDBALL_CD}{batted ball type}
#'     \item{BUNT_FL}{bunt flag}
#'     \item{FOUL_FL}{foul flag}
#'     \item{BATTEDBALL_LOC_TX}{hit location}
#'     \item{ERR_CT}{num errors}
#'     \item{ERR1_FLD_CD}{1st error player}
#'     \item{ERR1_CD}{1st error type}
#'     \item{ERR2_FLD_CD}{2nd error player}
#'     \item{ERR2_CD}{2nd error type}
#'     \item{ERR3_FLD_CD}{3rd error player}
#'     \item{ERR3_CD}{3rd error type}
#'     \item{BAT_DEST_ID}{batter dest}
#'     \item{RUN1_DEST_ID}{runner on 1st dest}
#'     \item{RUN2_DEST_ID}{runner on 2nd dest}
#'     \item{RUN3_DEST_ID}{runner on 3rd dest}
#'     \item{BAT_PLAY_TX}{play on batter}
#'     \item{RUN1_PLAY_TX}{play on runner on 1st}
#'     \item{RUN2_PLAY_TX}{play on runner on 2nd}
#'     \item{RUN3_PLAY_TX}{play on runner on 3rd}
#'     \item{RUN1_SB_FL}{SB for runner on 1st flag}
#'     \item{RUN2_SB_FL}{SB for runner on 2nd flag}
#'     \item{RUN3_SB_FL}{SB for runner on 3rd flag}
#'     \item{RUN1_CS_FL}{CS for runner on 1st flag}
#'     \item{RUN2_CS_FL}{CS for runner on 2nd flag}
#'     \item{RUN3_CS_FL}{CS for runner on 3rd flag}
#'     \item{RUN1_PK_FL}{PO for runner on 1st flag}
#'     \item{RUN2_PK_FL}{PO for runner on 2nd flag}
#'     \item{RUN3_PK_FL}{PO for runner on 3rd flag}
#'     \item{RUN1_RESP_PIT_ID}{responsible pitcher for runner on 1st}
#'     \item{RUN2_RESP_PIT_ID}{responsible pitcher for runner on 2nd}
#'     \item{RUN3_RESP_PIT_ID}{responsible pitcher for runner on 3rd}
#'     \item{GAME_NEW_FL}{new game flag}
#'     \item{GAME_END_FL}{end game flag}
#'     \item{PR_RUN1_FL}{pinch-runner on 1st}
#'     \item{PR_RUN2_FL}{pinch-runner on 2nd}
#'     \item{PR_RUN3_FL}{pinch-runner on 3rd}
#'     \item{REMOVED_FOR_PR_RUN1_ID}{runner removed for pinch-runner on 1st}
#'     \item{REMOVED_FOR_PR_RUN2_ID}{runner removed for pinch-runner on 2nd}
#'     \item{REMOVED_FOR_PR_RUN3_ID}{runner removed for pinch-runner on 3rd}
#'     \item{REMOVED_FOR_PH_BAT_ID}{batter removed for pinch-hitter}
#'     \item{REMOVED_FOR_PH_BAT_FLD_CD}{position of batter removed for pinch-hitter}
#'     \item{PO1_FLD_CD}{fielder with first putout}
#'     \item{PO2_FLD_CD}{fielder with second putout}
#'     \item{PO3_FLD_CD}{fielder with third putout}
#'     \item{ASS1_FLD_CD}{fielder with first assist}
#'     \item{ASS2_FLD_CD}{fielder with second assist}
#'     \item{ASS3_FLD_CD}{fielder with third assist}
#'     \item{ASS4_FLD_CD}{fielder with fourth assist}
#'     \item{ASS5_FLD_CD}{fielder with fifth assist}
#'     \item{EVENT_ID}{event num}
#'    }
#' @seealso [baseballr::retrosheet_data()]
#' @source [Retrosheet Event files](https://www.retrosheet.org/game.htm)
"retro2016"

#' Ted Williams' and Joe DiMaggio's 1941 seasons
#' @description
#' Game-by-game hitting data for Ted Williams and Joe DiMaggio in the 1941 season
#' @docType data
#' @source Baseball-Reference: <https://www.baseball-reference.com/players/gl.fcgi?id=dimagjo01&t=b&year=1941>
"dimaggio_1941"

#' @rdname dimaggio_1941
#' @docType data
#' @format
#'   \describe{
#'     \item{Rk}{A ranking index}
#'     \item{Gcar}{Cumulative number of career games}
#'     \item{Gtm}{game number}
#'     \item{Date}{date of game}
#'     \item{Tm}{player team}
#'     \item{X6}{indicates home or awy}
#'     \item{Opp}{opposing team}
#'     \item{Rslt}{game outcome}
#'     \item{Inngs}{number of innings played}
#'     \item{PA}{plate appearances}
#'     \item{AB}{at-bats}
#'     \item{R}{runs scored}
#'     \item{H}{hits}
#'     \item{X2B}{doubles}
#'     \item{X3B}{triples}
#'     \item{HR}{home runs}
#'     \item{RBI}{runs batted in}
#'     \item{BB}{walks}
#'     \item{IBB}{intentional walks}
#'     \item{SO}{strikeouts}
#'     \item{HBP}{hit by pitches}
#'     \item{SH}{sacrifice hits}
#'     \item{SF}{sacrifice flies}
#'     \item{ROE}{reached on an error}
#'     \item{GDP}{grounded in double play}
#'     \item{SB}{stolen bases}
#'     \item{CS}{caught stealing}
#'     \item{BA}{batting average}
#'     \item{OBP}{on-base percentage}
#'     \item{SLG}{slugging percentage}
#'     \item{OPS}{ops statistic}
#'     \item{BOP}{base-out percentage}
#'     \item{Pos}{fielding position}
#' }
#' @source Baseball-Reference: <https://www.baseball-reference.com/players/gl.fcgi?id=willite01&t=b&year=1941>
"williams_1941"

#' Ballpark names and game time temperatures for 2023
#' @docType data
#' @format 
#' \describe{
#'   \item{game_pk}{MLBAM game identifier}
#'   \item{temperature}{Game time temperature in degrees Fahrenheit}
#' }
"temps_2023"
#' @rdname temps_2023
#' @format 
#' \describe{
#'   \item{Park}{The name of the ballpark}
#'   \item{Dome}{Does the park have a domed roof?}
#' }
"parks_2023"

#' Pitch-by-pitch level detail for several players and umpires
#' @details
#' These data were scraped via the now-defunct `pitchrx` package.
#' 
#' @docType data
#' @format 
#'   \describe{
#'     \item{season}{The season}
#'     \item{gamedate}{Date of the game}
#'     \item{pitch_type}{Type of pitch}
#'     \item{balls}{Number of balls}
#'     \item{strikes}{Number of strikes}
#'     \item{speed}{Velocity of the pitch in miles per hour}
#'     \item{px}{Position of the pitch in the x-direction}
#'     \item{pz}{Position of the pitch in the z-direction}
#'     \item{swung}{Did the batter swing?}
#'     \item{hitx}{Location of the batted ball in the x-direction}
#'     \item{hity}{Location of the batted ball in the y-direction}
#'     \item{hit_outcome}{Outcome of the batted ball}
#'   }
#' @source <https://pitchrx.cpsievert.me/>
#' 
#' @seealso <https://beanumber.github.io/abdwr3e/06-pitchcount.html#behaviors-by-count>
#' 
"cabrera"
#' @rdname cabrera
#' @format 
#'   \describe{
#'     \item{pitches}{Number of pitches thrown}
#'     \item{batter_hand}{On which side of the plate was the batter standing?}
#'   }
"sanchez"
#' @rdname cabrera
#' @format 
#'   \describe{
#'     \item{umpire}{Identity of the umpire}
#'     \item{called_strike}{Was the pitch called a strike?}
#'   }
"umpires"
#' @rdname cabrera
"verlander"
