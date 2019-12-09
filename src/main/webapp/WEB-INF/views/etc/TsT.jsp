<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
		<title>Tournament Bracket Generator</title>
		<script src="https://code.jquery.com/jquery-1.8.3.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
		<script src="https://cdn.jsdelivr.net/clipboard.js/1.6.0/clipboard.min.js"></script>
		<script>
			$(document).on('ready', function() {
				
				var knownBrackets = [2,4,8,16,32], // brackets with "perfect" proportions (full fields, no byes)
				
					exampleTeams  = _.shuffle(["New Jersey Devils","New York Islanders","New York Rangers","Philadelphia Flyers","Pittsburgh Penguins","Boston Bruins","Buffalo Sabres","Montreal Canadiens","Ottawa Senators","Toronto Maple Leafs","Carolina Hurricanes","Florida Panthers","Tampa Bay Lightning","Washington Capitals","Winnipeg Jets","Chicago Blackhawks","Columbus Blue Jackets","Detroit Red Wings","Nashville Predators","St. Louis Blues","Calgary Flames","Colorado Avalanche","Edmonton Oilers","Minnesota Wild","Vancouver Canucks","Anaheim Ducks","Dallas Stars","Los Angeles Kings","Phoenix Coyotes","San Jose Sharks","Montreal Wanderers","Quebec Nordiques","Hartford Whalers"]), // because a bracket needs some teams!
					
					bracketCount = 0;
				
				/*
				 * Build our bracket "model"
				 */
				function getBracket(base) {
				
					var closest 		= _.find(knownBrackets, function(k) { return k>=base; }),
						byes 			= closest-base;
						
					if(byes>0)	base = closest;
				
					var brackets 	= [],
						round 		= 1,
						baseT 		= base/2,
						baseC 		= base/2,
						teamMark	= 0,
						nextInc		= base/2;
						
					for(i=1;i<=(base-1);i++) {
						var	baseR = i/baseT,
							isBye = false;
							
						if(byes>0 && (i%2!=0 || byes>=(baseT-i))) {
							isBye = true;
							byes--;
						}
						
						var last = _.map(_.filter(brackets, function(b) { return b.nextGame == i; }), function(b) { return {game:b.bracketNo,teams:b.teamnames}; });
						
						brackets.push({
							lastGames:	round==1 ? null : [last[0].game,last[1].game],
							nextGame:	nextInc+i>base-1?null:nextInc+i,
							teamnames:	round==1 ? [exampleTeams[teamMark],exampleTeams[teamMark+1]] : [last[0].teams[_.random(1)],last[1].teams[_.random(1)]],
							bracketNo:	i,
							roundNo:	round,
							bye:		isBye
						});
						teamMark+=2;
						if(i%2!=0)	nextInc--;
						while(baseR>=1) {
							round++;
							baseC/= 2;
							baseT = baseT + baseC;
							baseR = i/baseT;
						}
					}
					
					renderBrackets(brackets);
				}
				
				/*
				 * Inject our brackets
				 */
				function renderBrackets(struct) {
					var groupCount	= _.uniq(_.map(struct, function(s) { return s.roundNo; })).length;
					
					var group	= $('<div class="group'+(groupCount+1)+'" id="b'+bracketCount+'"></div>'),
						grouped = _.groupBy(struct, function(s) { return s.roundNo; });
					for(g=1;g<=groupCount;g++) {
						var round = $('<div class="r'+g+'"></div>');
						_.each(grouped[g], function(gg) {
							if(gg.bye)
								round.append('<div></div>');
							else
								round.append('<div><div class="bracketbox"><span class="info">'+gg.bracketNo+'</span><span class="teama" contenteditable>'+gg.teamnames[0]+'</span><span class="teamb" contenteditable>'+gg.teamnames[1]+'</span></div></div>');
						});
						group.append(round);
					}
					group.append('<div class="r'+(groupCount+1)+'"><div class="final"><div class="bracketbox"><span class="teamc" contenteditable>'+_.last(struct).teamnames[_.random(1)]+'</span></div></div></div>');
					$('#brackets').append(group);
					
					bracketCount++;
					$('html,body').animate({
						scrollTop: $("#b"+(bracketCount-1)).offset().top
					});
				}
				
				new Clipboard('.copyBtn', {
				    text: function(trigger) {
					return $('#brackets')[0].outerHTML;
				    }
				});
				
				new Clipboard('.copyBtnCss', {
				    text: function(trigger) {
					return $('style')[0].outerHTML + $('#brackets')[0].outerHTML;
				    }
				});
				
				$('#add').on('click', function() {
					var opts = parseInt(prompt('Bracket size (number of teams):',32));
					
					if(!_.isNaN(opts) && opts <= _.last(knownBrackets))
						getBracket(opts);
					else
						alert('The bracket size you specified is not currently supported.');
				});
				
			});
		</script>
		<style type="text/css">
			html, body, .brackets {
				width: 100%;
				min-height: 100%;
				font-family: "Arial", sans-serif;
			}
			.metroBtn {
				background-color: #2E7BCC;
				color: #fff;
				font-size: 1.1em;
				padding: 10px;
				display: inline-block;
				margin-bottom: 30px;
				cursor: pointer;
			}
			.brackets > div {
				vertical-align: top;
				clear: both;
			}
			.brackets > div > div {
				float: left;
				height: 100%;
			}
			.brackets > div > div > div {
				margin: 50px 0;
			}
			.brackets div.bracketbox {
				position: relative;
				width: 100%; height: 100%;
				border-top: 1px solid #555;
				border-right: 1px solid #555;
				border-bottom: 1px solid #555;
			}
			.brackets div.bracketbox > span.info {
				position: absolute;
				top: 25%;
				left: 25%;
				font-size: 0.8em;
				color: #BBB;
			}
			.brackets div.bracketbox > span {
				position: absolute;
				left: 5px;
				font-size: 0.85em;
			}
			.brackets div.bracketbox > span.teama {
				top: -20px;
			}
			.brackets div.bracketbox > span.teamb {
				bottom: -20px;
			}
			.brackets div.bracketbox > span.teamc {
				bottom: 1px;
			}
			.brackets > .group2 {
				height: 260px;
			}
			.brackets > .group2 > div {
				width: 49%;
			}
			.brackets > .group3 {
				height: 320px;
			}
			.brackets > .group3 > div {
				width: 32.7%;
			}
			.brackets > .group4 > div {
				width: 24.5%;
			}
			.brackets > .group5 > div {
				width: 19.6%;
			}
			.brackets > .group6 {
				height: 2000px;
			}
			.brackets > .group6 > div {
				width: 16.3%;
			}
			.brackets > div > .r1 > div {
				height: 60px;
			}
			.brackets > div > .r2 > div {
				margin: 80px 0 110px 0;
				height: 110px;
			}
			.brackets > div > .r3 > div {
				margin: 135px 0 220px 0;
				height: 220px;
			}
			.brackets > div > .r4 > div {
				margin: 250px 0 445px 0;
				height: 445px;
			}
			.brackets > div > .r5 > div {
				margin: 460px 0 0 0;
				height: 900px;
			}
			.brackets > div > .r6 > div {
				margin: 900px 0 0 0;
			}
			.brackets div.final > div.bracketbox {
				border-top: 0px;
				border-right: 0px;
				height: 0px;
			}
			.brackets > div > .r4 > div.drop {
				height: 180px;
				margin-bottom: 0px;
			}
			.brackets > div > .r5 > div.final.drop {
				margin-top: 345px;
				margin-bottom: 0px;
				height: 1px;
			}
			.brackets > div > div > div:last-of-type {
				margin-bottom: 0px;
			}
		</style>
<body>
  <main id="js-page-content" role="main" class="page-content">
  <div id="add" class="metroBtn">토너먼트 만들기! 갯수 만들기</div>
		<div class="brackets" id="brackets">
		</div>
  </main>

</body>
</html>