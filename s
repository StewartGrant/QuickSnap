[1mdiff --git a/src/GameLogic/Snap.cs b/src/GameLogic/Snap.cs[m
[1mindex 42894a1..7892f97 100644[m
[1m--- a/src/GameLogic/Snap.cs[m
[1m+++ b/src/GameLogic/Snap.cs[m
[36m@@ -37,6 +37,7 @@[m [mnamespace CardGames.GameLogic[m
 		public Snap ()[m
 		{[m
 			_deck = new Deck ();[m
[32m+[m			[32m_gameTimer = SwinGame.CreateTimer ();[m
 		}[m
 [m
 		/// <summary>[m
[36m@@ -92,6 +93,7 @@[m [mnamespace CardGames.GameLogic[m
 				_deck.Shuffle ();		// Return the cards and shuffle[m
 [m
 				FlipNextCard ();		// Flip the first card...[m
[32m+[m				[32m_gameTimer.Start();[m
 			}[m
 		}[m
 			[m
[36m@@ -112,6 +114,11 @@[m [mnamespace CardGames.GameLogic[m
 		public void Update()[m
 		{[m
 			//TODO: implement update to automatically slip cards![m
[32m+[m			[32mif (_gameTimer.Ticks > _flipTime)[m
[32m+[m			[32m{[m
[32m+[m				[32m_gameTimer.Reset();[m
[32m+[m				[32mFlipNextCard ();[m
[32m+[m			[32m}[m
 		}[m
 [m
 		/// <summary>[m
[36m@@ -143,6 +150,7 @@[m [mnamespace CardGames.GameLogic[m
 [m
 			// stop the game...[m
 			_started = false;[m
[32m+[m			[32m_gameTimer.Stop ();[m
 		}[m
 	[m
 		#region Snap Game Unit Tests[m
[1mdiff --git a/src/SnapGame.cs b/src/SnapGame.cs[m
[1mindex ec78e90..25764ae 100644[m
[1m--- a/src/SnapGame.cs[m
[1m+++ b/src/SnapGame.cs[m
[36m@@ -24,7 +24,7 @@[m [mnamespace CardGames[m
 [m
 			if (SwinGame.KeyTyped (KeyCode.vk_SPACE))[m
 			{[m
[31m-				myGame.FlipNextCard ();[m
[32m+[m				[32mmyGame.Start ();[m
 			}[m
 		}[m
 [m
