-- ============================================================
-- OBSOLETE Signal Pipeline · Migration 014 — Maazah General Food Expansion
-- ============================================================
-- Run AFTER 013_maazah_pillar_expansion.sql.
-- Maazah's lane isn't just heritage food — it's general cooking + everyday
-- recipes + condiment culture + sauce-shopping + cooking entertainment.
-- This migration adds ~55 sources across mainstream food culture so the
-- engine catches viral recipes, sauce-aisle trends, weeknight-cooking
-- conversations, cooking-show moments — not just Afghan-American press.
--
-- Brings seed: 145 → ~200 sources.
-- Calibrated 2026-05-27. Each source carries POV per source.
-- ============================================================

-- ----- LANE 1: HEALTH — broader functional + clean-label sauce/dip surface -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Dipping sauce', 'Dipping sauce (Wikipedia)', 'HEALTH', 'flavor',
   'Category-defining page for the dip set Maazah lives in. Spike = cultural attention on dipping as a meal-format moment.', '{}'),
  ('maazah', 'wikipedia', 'Condiment', 'Condiment (Wikipedia)', 'HEALTH', 'flavor',
   'Broader category page — Maazah''s sauces (Lemon Aioli, Chili Aioli, Cilantro Chutney) live here. Tracks condiment-culture velocity.', '{}'),
  ('maazah', 'wikipedia', 'Functional food', 'Functional food (Wikipedia)', 'HEALTH', 'flavor',
   'Functional positioning is half the Maazah-lentil-dip story. Spike = wellness press cycle on functional ingredients.', '{}'),
  ('maazah', 'wikipedia', 'Plant-based diet', 'Plant-based diet (Wikipedia)', 'HEALTH', 'flavor',
   'Broader plant-based context — Maazah lentil dips are inherently plant-based protein. Mainstream attention tracker.', '{}'),
  ('maazah', 'google_trends', 'healthy dip', null, 'HEALTH', 'flavor',
   'Mainstream search term. Spike correlates with diet-cycle press + new-year cleanse content.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'low sugar sauce', null, 'HEALTH', 'flavor',
   'Clean-label search. Maazah''s sauces are no-added-sugar (Cilantro/Lemon Aioli) — direct positioning lane.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'dairy free dip', null, 'HEALTH', 'flavor',
   'Allergen-aware shopper search. Maazah lentil dips are inherently dairy-free.', '{"geo": "US"}'),
  ('maazah', 'reddit', 'MealPrepSunday', 'r/MealPrepSunday', 'HEALTH', 'flavor',
   'Meal-prep community — sauces are crucial to meal-prep workflow. Maazah sauce-bottle usage tracker.', '{}'),
  ('maazah', 'reddit', 'fitmeals', 'r/fitmeals', 'HEALTH', 'flavor',
   'Fitness-meal community. Lentil dip as protein-stack snack lives here directly.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 2: INGREDIENTS — mainstream cooking + recipe culture -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  -- Sauce category peer-pages
  ('maazah', 'wikipedia', 'Hot sauce', 'Hot sauce (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Adjacent sauce category — Chili Aioli sits at the edge of this lane. Hot-sauce-trend velocity = adjacent-shelf attention.', '{}'),
  ('maazah', 'wikipedia', 'Romesco', 'Romesco (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Spanish sauce peer — same fridge-condiment register as Maazah''s aiolis. Recipe-culture overlap.', '{}'),
  ('maazah', 'wikipedia', 'Chimichurri', 'Chimichurri (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Argentine sauce peer — Cilantro Chutney occupies similar usage lane. Spike = grilling-season attention.', '{}'),
  ('maazah', 'wikipedia', 'Salsa verde', 'Salsa verde (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Green-sauce peer page. Heritage + dip-on-everything register overlaps with Maazah''s Cilantro Chutney.', '{}'),
  ('maazah', 'wikipedia', 'Vinaigrette', 'Vinaigrette (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Fridge-condiment adjacent — Lemon Aioli plays vinaigrette-role on salads.', '{}'),
  ('maazah', 'wikipedia', 'Yogurt sauce', 'Yogurt sauce (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Direct adjacent dip category. Maazah lentil dips reach this audience.', '{}'),
  ('maazah', 'wikipedia', 'Sauce', 'Sauce (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Master category page — broad cultural-attention indicator on sauce as a food format.', '{}'),
  -- Google Trends — viral recipe surface
  ('maazah', 'google_trends', 'weeknight dinner', null, 'INGREDIENTS', 'flavor',
   'Massive search term. Maazah''s sauces enable weeknight-cooking — direct shopper-intent overlap.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'easy recipe', null, 'INGREDIENTS', 'flavor',
   'Mainstream search — viral-recipe surge indicator.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'tiktok recipe', null, 'INGREDIENTS', 'flavor',
   'TikTok-driven recipe discovery. Spike = viral recipe wave landing.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'fridge sauce', null, 'INGREDIENTS', 'flavor',
   'Direct category-creation term Maazah lives in. Branded vocab for fridge-sauce shoppers.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'summer recipe', null, 'INGREDIENTS', 'flavor',
   'Seasonal driver — Memorial Day → Labor Day window. Direct snackle-box + grilling pairing trigger.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'dipping sauce', null, 'INGREDIENTS', 'flavor',
   'Category-search term. Direct lane indicator.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'sauce recipe', null, 'INGREDIENTS', 'flavor',
   'DIY-recipe interest — when this spikes, Maazah''s ready-made-sauce positioning wins (skip-the-recipe).', '{"geo": "US"}'),
  -- Reddit — mainstream cooking communities
  ('maazah', 'reddit', 'easyrecipes', 'r/easyrecipes', 'INGREDIENTS', 'flavor',
   'Beginner-friendly recipes community. Sauce-driven simple cooking lives here.', '{}'),
  ('maazah', 'reddit', 'GifRecipes', 'r/GifRecipes', 'INGREDIENTS', 'flavor',
   'Visual recipe community — viral-recipe early indicator.', '{}'),
  ('maazah', 'reddit', 'seriouseats', 'r/seriouseats', 'INGREDIENTS', 'flavor',
   'Higher-quality recipe community linked to Serious Eats — tastemaker audience.', '{}'),
  ('maazah', 'reddit', 'CookbookLovers', 'r/CookbookLovers', 'INGREDIENTS', 'flavor',
   'Cookbook discovery community. Heritage cookbook + Maazah peer-set crossover.', '{}'),
  ('maazah', 'reddit', 'hotsaucerecipes', 'r/hotsaucerecipes', 'INGREDIENTS', 'flavor',
   'Hot-sauce community — adjacent to Chili Aioli. Sauce-culture conversation density.', '{}'),
  ('maazah', 'reddit', 'EatCheapAndPlantBased', 'r/EatCheapAndPlantBased', 'INGREDIENTS', 'flavor',
   'Plant-based budget cooking — lentil dip is the affordable-protein hero here.', '{}'),
  -- RSS — mainstream food editorial
  ('maazah', 'rss', 'https://cooking.nytimes.com/feed', 'NYT Cooking', 'INGREDIENTS', 'flavor',
   'THE recipe-tastemaker source for the audience. Editor''s picks shape weeknight-cooking conversation.', '{}'),
  ('maazah', 'rss', 'https://smittenkitchen.com/feed/', 'Smitten Kitchen · Deb Perelman', 'INGREDIENTS', 'flavor',
   'Indie home-cooking authority. Recipe posts drive heavy reader-recipe trial.', '{}'),
  ('maazah', 'rss', 'https://www.tasty.co/feed', 'Tasty · BuzzFeed', 'INGREDIENTS', 'flavor',
   'Mass-audience viral-recipe production. Recipe-Reel format wave indicator.', '{}'),
  ('maazah', 'rss', 'https://www.npr.org/rss/rss.php?id=1053', 'NPR The Salt · food + culture', 'INGREDIENTS', 'flavor',
   'Public-radio food journalism. Long-tail cultural-food story discovery.', '{}'),
  ('maazah', 'rss', 'https://www.halfbakedharvest.com/feed/', 'Half Baked Harvest · Tieghan Gerard', 'INGREDIENTS', 'flavor',
   'Indie recipe blog with massive Pinterest reach. Sauce-driven recipe pattern source.', '{}'),
  ('maazah', 'rss', 'https://www.seriouseats.com/feed/', 'Serious Eats', 'INGREDIENTS', 'flavor',
   'Higher-quality recipe + technique editorial — chef-aware audience.', '{}'),
  ('maazah', 'rss', 'https://eric-kim.beehiiv.com/feed', 'Eric Kim · NYT Cooking newsletter', 'INGREDIENTS', 'flavor',
   'NYT Cooking writer''s personal newsletter — heritage cooking + creative recipes. Direct tonal overlap.', '{}'),
  ('maazah', 'rss', 'https://www.foodnetwork.com/feed/index.rss', 'Food Network', 'INGREDIENTS', 'flavor',
   'Mass-market recipe + show coverage. Chef + show moments indicator.', '{}'),
  -- YouTube channel RSS — recipe-creator + chef channels
  ('maazah', 'youtube_rss', 'UCRIZtPl9nb9RiXc9btSTQNw', 'Bon Appétit Test Kitchen', 'INGREDIENTS', 'flavor',
   'Massive Test Kitchen following — recipe demos shape cooking-culture standards. Sauce-segment content surfaces here.', '{"channel_name": "Bon Appétit"}'),
  ('maazah', 'youtube_rss', 'UCpaJU3Y4mAFKwG-Lf4XmkAg', 'Joshua Weissman', 'INGREDIENTS', 'flavor',
   'Top recipe-explainer YouTube channel. Sauce + technique content drives massive viewer trial.', '{"channel_name": "Joshua Weissman"}'),
  ('maazah', 'youtube_rss', 'UC1ChWoAW9MD1S4OZqsj_KaQ', 'NYT Cooking YouTube', 'INGREDIENTS', 'flavor',
   'NYT Cooking video — chef segments shape recipe-culture audience taste.', '{"channel_name": "NYT Cooking"}'),
  ('maazah', 'youtube_rss', 'UCDq5v10l4wkV5-ZBIJJFbzQ', 'Adam Ragusea', 'INGREDIENTS', 'flavor',
   'Recipe-science-explainer channel. Sauce-making chemistry + technique content lives here.', '{"channel_name": "Adam Ragusea"}'),
  ('maazah', 'youtube_rss', 'UCJHA_jMfCvEnv-3kRjTCQXw', 'Babish Culinary Universe', 'INGREDIENTS', 'flavor',
   'Massive home-chef recipe channel. Sauce/condiment-feature episodes = viral trigger.', '{"channel_name": "Babish"}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 4: REVIEWS / DISCOVERY — mainstream food culture authority -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'James Beard Foundation', 'James Beard Foundation (Wikipedia)', 'REVIEWS', 'pulse',
   'Food-industry recognition body. Beard Award nominations + media events = peer-set discovery moments.', '{}'),
  ('maazah', 'wikipedia', 'Specialty Food Association', 'Specialty Food Association (Wikipedia)', 'REVIEWS', 'shelf',
   'Trade-body for the specialty fridge-set Maazah lives in. Fancy Food Show + awards cycle indicator.', '{}'),
  ('maazah', 'reddit', 'wholefoodshaul', 'r/wholefoodshaul', 'REVIEWS', 'shelf',
   'Whole Foods shopping community — Maazah is nationwide here since Nov 2024. Direct UGC surface.', '{}'),
  ('maazah', 'reddit', 'Trader_Joes', 'r/Trader_Joes', 'REVIEWS', 'shelf',
   'TJ shopping community. Adjacent shopper context — what TJ shoppers buy vs. seek elsewhere.', '{}'),
  ('maazah', 'tiktok_cc', 'foodtok_us_7d', 'TikTok CC · #foodtok US 7d', 'REVIEWS', 'pulse',
   'Master food discovery hashtag — Maazah-adjacent content velocity indicator.', '{"region": "US", "hashtag": "foodtok", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'saucetok_us_7d', 'TikTok CC · #saucetok US 7d', 'REVIEWS', 'flavor',
   'Direct category hashtag — sauce-product discovery + viral sauce-pour content.', '{"region": "US", "hashtag": "saucetok", "window": "7d"}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 5: CULTURAL — cooking entertainment + recipe-meme depth -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  -- Cooking show / entertainment Wikipedia pages
  ('maazah', 'wikipedia', 'Top Chef', 'Top Chef (Wikipedia)', 'CULTURAL', 'pulse',
   'Major US cooking competition. Season premieres + finale = mass-cultural-food moments.', '{}'),
  ('maazah', 'wikipedia', 'MasterChef (American TV series)', 'MasterChef US (Wikipedia)', 'CULTURAL', 'pulse',
   'Mass-audience cooking competition. Season cycle = cultural cooking-attention pulse.', '{}'),
  ('maazah', 'wikipedia', 'Cooking show', 'Cooking show (Wikipedia) — genre page', 'CULTURAL', 'pulse',
   'Genre page — broader cooking-entertainment-attention indicator.', '{}'),
  ('maazah', 'wikipedia', 'The Great British Bake Off', 'The Great British Bake Off (Wikipedia)', 'CULTURAL', 'pulse',
   'Cultural-touchstone food show — adjacent cooking-culture audience.', '{}'),
  ('maazah', 'wikipedia', 'Chrissy Teigen', 'Chrissy Teigen (Wikipedia)', 'CULTURAL', 'pulse',
   'Cookbook author + Cravings founder — visited Maazah''s Expo West booth. Press cycle = direct co-mention opportunity.', '{}'),
  ('maazah', 'wikipedia', 'Stanley Tucci', 'Stanley Tucci (Wikipedia)', 'CULTURAL', 'pulse',
   'Cookbook + food-show culture. Heritage-cooking-as-cultural-act tonal twin.', '{}'),
  ('maazah', 'wikipedia', 'Ina Garten', 'Ina Garten (Wikipedia)', 'CULTURAL', 'pulse',
   'Mainstream food authority. Press cycle = mass cooking-conversation moment.', '{}'),
  -- Google Trends — cooking moment archetypes
  ('maazah', 'google_trends', 'viral recipe', null, 'CULTURAL', 'pulse',
   'Direct trending-recipe interest term. Spike = viral wave to ride.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'cooking trend', null, 'CULTURAL', 'pulse',
   'Mass cooking-culture pulse term.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'food trend', null, 'CULTURAL', 'pulse',
   'Adjacent culture-pulse signal.', '{"geo": "US"}'),
  -- TikTok hashtags — recipe + cooking content discovery
  ('maazah', 'tiktok_cc', 'recipevideo_us_7d', 'TikTok CC · #recipevideo US 7d', 'CULTURAL', 'pulse',
   'Recipe-content master hashtag — Maazah recipe Reels live here.', '{"region": "US", "hashtag": "recipevideo", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'cookingtok_us_7d', 'TikTok CC · #cookingtok US 7d', 'CULTURAL', 'pulse',
   'Cooking-content master hashtag — adjacent discovery surface.', '{"region": "US", "hashtag": "cookingtok", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'easyrecipe_us_7d', 'TikTok CC · #easyrecipe US 7d', 'CULTURAL', 'pulse',
   'Quick-recipe discovery — sauce-driven simple recipes win here.', '{"region": "US", "hashtag": "easyrecipe", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'dinneridea_us_7d', 'TikTok CC · #dinneridea US 7d', 'CULTURAL', 'pulse',
   'Weeknight-cooking discovery — direct Maazah usage lane.', '{"region": "US", "hashtag": "dinneridea", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'weeknightcooking_us_7d', 'TikTok CC · #weeknightcooking US 7d', 'CULTURAL', 'pulse',
   'Adjacent search term — fridge-sauce usage moment.', '{"region": "US", "hashtag": "weeknightcooking", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'fridgesauce_us_7d', 'TikTok CC · #fridgesauce US 7d', 'CULTURAL', 'pulse',
   'Hyper-specific Maazah-category hashtag — direct discovery surface.', '{"region": "US", "hashtag": "fridgesauce", "window": "7d"}'),
  -- Reddit — food culture aggregators
  ('maazah', 'reddit', 'foodporn', 'r/foodporn', 'CULTURAL', 'pulse',
   '17M+ food-visual community. Viral-food-imagery early indicator.', '{}'),
  ('maazah', 'reddit', 'Top_Chef', 'r/Top_Chef', 'CULTURAL', 'pulse',
   'Top Chef fan community — cooking-entertainment-culture pulse.', '{}'),
  ('maazah', 'reddit', 'TheBear', 'r/TheBear', 'CULTURAL', 'pulse',
   'Bear FX-show community — chef-culture + family-business-restaurant tonal twin.', '{}'),
  ('maazah', 'reddit', 'cookingvideos', 'r/cookingvideos', 'CULTURAL', 'pulse',
   'Cooking-video aggregation community. Viral recipe-Reel pulse.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 6: COMPETITIVE — broader sauce + condiment competitor set -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Mike''s Hot Honey', 'Mike''s Hot Honey (Wikipedia)', 'COMPETITIVE', 'shelf',
   'Sauce-category breakout brand of the past 5 years. Press cycle = sauce-cultural-attention indicator + playbook reference.', '{}'),
  ('maazah', 'wikipedia', 'Tabasco sauce', 'Tabasco sauce (Wikipedia)', 'COMPETITIVE', 'shelf',
   'Hot-sauce category incumbent. Press cycle = sauce-category cultural attention.', '{}'),
  ('maazah', 'wikipedia', 'Truff', 'Truff (sauce brand)', 'COMPETITIVE', 'shelf',
   'Premium-design sauce peer. Direct playbook reference for design-led sauce branding.', '{}'),
  ('maazah', 'meta_ad_library', 'MikesHotHoney', 'Meta Ad Library · Mike''s Hot Honey', 'COMPETITIVE', 'shelf',
   'Sauce breakout brand ad-creative + spend tracker. Direct playbook reference.', '{"page_name": "Mike''s Hot Honey"}'),
  ('maazah', 'meta_ad_library', 'TruffSauce', 'Meta Ad Library · Truff', 'COMPETITIVE', 'shelf',
   'Premium sauce ad-creative tracker.', '{"page_name": "Truff"}'),
  ('maazah', 'meta_ad_library', 'ChosenFoods', 'Meta Ad Library · Chosen Foods', 'COMPETITIVE', 'shelf',
   'Premium condiment brand (avocado oil + mayo). Adjacent fridge-set + clean-label tracker.', '{"page_name": "Chosen Foods"}'),
  ('maazah', 'rss', 'https://www.foodbusinessnews.net/rss/feed', 'Food Business News · Sosland trade', 'COMPETITIVE', 'shelf',
   'Top food-industry trade publication. Brand launches + M&A + retail-buyer-side coverage.', '{}'),
  ('maazah', 'rss', 'https://www.foodprocessing.com/rss/', 'Food Processing · trade', 'COMPETITIVE', 'shelf',
   'Production + manufacturing trade — competitor formulation + co-pack signals.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 8: RETAIL — broader retail-culture + grocery shopper surface -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Refrigerated foods', 'Refrigerated foods (Wikipedia)', 'RETAIL', 'shelf',
   'Category-set page. Spike = mainstream attention on fridge-aisle dynamics.', '{}'),
  ('maazah', 'reddit', 'aldi', 'r/aldi', 'RETAIL', 'shelf',
   'Aldi shopping community — different-shopper context for fridge-section pricing dynamics.', '{}'),
  ('maazah', 'youtube_rss', 'UCRgQqd1JaaUEohWGdiW3hpA', 'TheDealGuy · Costco hauls', 'RETAIL', 'shelf',
   'Top Costco-haul YouTube channel. Maazah RRP appearance = direct UGC amplification opportunity.', '{"channel_name": "TheDealGuy"}'),
  ('maazah', 'tiktok_cc', 'traderjoeshaul_us_7d', 'TikTok CC · #traderjoeshaul US 7d', 'RETAIL', 'shelf',
   'Adjacent retail-haul hashtag. TJ shopper context for the Maazah-curious cohort.', '{"region": "US", "hashtag": "traderjoeshaul", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'aldifinds_us_7d', 'TikTok CC · #aldifinds US 7d', 'RETAIL', 'shelf',
   'Adjacent value-retail discovery hashtag — broader grocery-culture pulse.', '{"region": "US", "hashtag": "aldifinds", "window": "7d"}')
on conflict (client_id, source, target) do nothing;

-- ============================================================
-- Additional keywords for general food + cooking scoring
-- ============================================================
insert into pipeline.client_keywords (client_id, pillar, keyword, weight) values
  -- Cooking entertainment + culture (CULTURAL → MAGIC IS REAL)
  ('maazah', 'MAGIC IS REAL', 'top chef', 1.2),
  ('maazah', 'MAGIC IS REAL', 'masterchef', 1.1),
  ('maazah', 'MAGIC IS REAL', 'james beard', 1.3),
  ('maazah', 'MAGIC IS REAL', 'food network', 1.0),
  ('maazah', 'MAGIC IS REAL', 'chef culture', 1.1),
  -- Mainstream cooking + recipe (PUT IT ON EVERYTHING)
  ('maazah', 'PUT IT ON EVERYTHING', 'weeknight dinner', 1.3),
  ('maazah', 'PUT IT ON EVERYTHING', 'easy recipe', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'viral recipe', 1.4),
  ('maazah', 'PUT IT ON EVERYTHING', 'tiktok recipe', 1.4),
  ('maazah', 'PUT IT ON EVERYTHING', 'fridge sauce', 1.6),
  ('maazah', 'PUT IT ON EVERYTHING', 'dipping sauce', 1.4),
  ('maazah', 'PUT IT ON EVERYTHING', 'summer recipe', 1.3),
  ('maazah', 'PUT IT ON EVERYTHING', 'grilling sauce', 1.3),
  ('maazah', 'PUT IT ON EVERYTHING', 'cooking hack', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'meal prep', 1.2),
  -- Sauce/condiment category (PUT IT ON EVERYTHING)
  ('maazah', 'PUT IT ON EVERYTHING', 'romesco', 1.1),
  ('maazah', 'PUT IT ON EVERYTHING', 'chimichurri', 1.1),
  ('maazah', 'PUT IT ON EVERYTHING', 'salsa verde', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'yogurt sauce', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'hot honey', 1.3),
  -- Saucy Squad — discovery
  ('maazah', 'SAUCY SQUAD', 'foodtok', 1.3),
  ('maazah', 'SAUCY SQUAD', 'saucetok', 1.5),
  ('maazah', 'SAUCY SQUAD', 'recipe creator', 1.2),
  ('maazah', 'SAUCY SQUAD', 'food blogger', 1.1),
  ('maazah', 'SAUCY SQUAD', 'cookbook author', 1.2)
on conflict (client_id, pillar, keyword) do update set weight = excluded.weight;

-- ============================================================
-- Verification
-- ============================================================
-- select count(*) from pipeline.client_sources where client_id = 'maazah';
-- Expected: ~200 sources total (145 + ~55 new)
--
-- select lane, count(*) from pipeline.client_sources
--   where client_id = 'maazah' group by lane order by count desc;
-- Expected: CULTURAL ~67, INGREDIENTS ~57, COMPETITIVE ~25, HEALTH ~24,
--   RETAIL ~20, REVIEWS ~17, POLICY ~3, PARENTING ~2
