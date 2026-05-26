-- ============================================================
-- OBSOLETE Signal Pipeline · Seed v3 — Maazah
-- ============================================================
-- Run AFTER 001_pipeline_schema.sql (and any 002-011 already applied).
-- Seeds: Maazah client + 6 agents + ~100 watchlist sources + ~40 keywords.
-- V0.1 — calibrated 2026-05-26 against @maazahmagic IG + TikTok corpus.
-- Strategy doc: ~/Desktop/CODING/MAAZAH/SIGNAL_PIPELINE.md
-- ============================================================

-- ============================================================
-- 1. Client row
-- ============================================================
insert into pipeline.clients (id, name, pillars, brand_terms, competitor_terms, audience_notes)
values (
  'maazah',
  'Maazah',
  array['MAGIC IS REAL', 'PUT IT ON EVERYTHING', 'MOM''S TABLE', 'SAUCY SQUAD'],
  array[
    'maazah', 'maazahmagic', 'maazahchutney', 'sajady',
    'yasameen sajady', 'sheilla sajady', 'saj80', 'yas.a.meen',
    'cilantro chutney', 'mango chutney', 'lemon aioli', 'chili aioli',
    'lentil dip', 'magic sauce', 'mom''s magic green',
    'swicy', 'zestie bestie', 'put it on everything',
    'ketchup ain''t got chut', 'magic is real'
  ],
  array[
    'sabra', 'cedar''s', 'boar''s head', 'hope foods',
    'fly by jing', 'omsom', 'yo mama''s foods',
    'brightland', 'graza', 'fishwife', 'salam hello',
    'diaspora co', 'burlap & barrel', 'spicewalla',
    'trader joe''s zhug', 'trader joe''s cilantro crema'
  ],
  'First-gen Afghan-American + sister-narrator + groove-summer music (Roy Ayers, John Summit) + Costco-aware + Heritage-without-distillation. Saucy-squad community-led. Reads Cherry Bombe + Vittles + The Bear final season + Anjali Pinto. IG-active (lane that works), TikTok-curious now (category-explainer is the only format that lands). Costco-aisle hauler-adjacent. Belief: chutney is the original sauce. Sisters Yasameen + Sheilla on-camera comfortable; family (Mom) is canonical origin reference, NEVER required participant.'
)
on conflict (id) do update set
  pillars = excluded.pillars,
  brand_terms = excluded.brand_terms,
  competitor_terms = excluded.competitor_terms,
  audience_notes = excluded.audience_notes;

-- ============================================================
-- 2. Agent roster — Maazah's 6 named agents (one per generic function)
-- ============================================================
insert into pipeline.client_agents (client_id, agent_id, function, display_name, description, focus, icon, cadence) values
  ('maazah', 'flavor', 'sensory', 'Flavor Lab',
   'Watches chutney + lentil-dip + sauce category discourse + ingredient theater to surface sensory-trend velocity.',
   'chutney + lentil + aioli + heritage spices, dip + sauce category creation, recipe pattern emergence', '⚗️', 'daily'),

  ('maazah', 'heritage', 'sustainability', 'Heritage Trace',
   'Tracks Afghan-American + diaspora food culture, Mom''s-recipe lineage, halal/kosher cert culture, heritage-food press cycles.',
   'Afghan diaspora cooking, first-gen identity content, heritage-food editorial, cultural permission moments', '🌿', 'daily'),

  ('maazah', 'pulse', 'cultural', 'Cultural Pulse Tracker',
   'Listens across platform-native cultural sources for the riff-able moments — music drops in Maazah''s groove lane, TV peaks, first-gen archetype waves, viral recipes.',
   'TikTok memes, viral recipes, music drops (Roy Ayers + John Summit lane), first-gen archetypes, festival timing, snackle-box format velocity', '📡', '4x daily'),

  ('maazah', 'shelf', 'competitive', 'Shelf Watch',
   'Catches competitor launches 7-14 days before retail via ad library + press release RSS + trade-show exhibitor lists. Plus Costco/Sprouts/WF/Albertsons retail-side intel.',
   'Hope Foods, Fly By Jing, Omsom, Sabra, Yo Mama''s ad creative + spend; Costco-aisle UGC + retailer rollout patterns; Albertsons Innovation Launchpad cycle', '🛒', 'daily'),

  ('maazah', 'voice', 'voice', 'Voice Compass',
   'Audits every brief against the Maazah Voice Compass — IG groove lane vs. TikTok meme-fluent lane, ≤1 wordplay payoff, ≤60% magic-headline ratio, sister-as-narrator, no Mom required.',
   'per-brief voice audit, music-lane validation by platform, emoji palette match, family-rule enforcement', '💬', 'per-brief'),

  ('maazah', 'strategist', 'strategist', 'The Strategist',
   'On-demand riff partner — drafts alternatives, pressure-tests against operating model, runs counter-scenarios.',
   'live Q&A inside Studio; full engine context available; cross-tenant pattern detection', '🧠', 'on-demand')
on conflict (client_id, agent_id) do update set
  function = excluded.function,
  display_name = excluded.display_name,
  description = excluded.description,
  focus = excluded.focus,
  icon = excluded.icon,
  cadence = excluded.cadence;

-- ============================================================
-- 3. Sources — the ~55-source watchlist with POV per source
-- ============================================================

-- ----- LANE 1: HEALTH (Flavor Lab) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Lentil', 'Lentil (Wikipedia)', 'HEALTH', 'flavor',
   'The category-defining page for the lentil-dip category Maazah is creating. Pageview spikes correlate with plant-protein press cycles + recipe-moment acceleration.', '{}'),
  ('maazah', 'wikipedia', 'Chutney', 'Chutney (Wikipedia)', 'HEALTH', 'flavor',
   'The brand''s master metaphor in encyclopedia form. Spike = chutney-curiosity entering mainstream culture — direct ride window for the "What is chutney?" pattern.', '{}'),
  ('maazah', 'wikipedia', 'Pulse (legume)', 'Pulse (legume) (Wikipedia)', 'HEALTH', 'flavor',
   'Adjacent category page. Helps Maazah ride pulse-protein moments without naming hummus.', '{}'),
  ('maazah', 'wikipedia', 'Hummus', 'Hummus (Wikipedia)', 'HEALTH', 'flavor',
   'Incumbent category. Velocity tells us when "the dip aisle" is heating up — opportunity to claim lentil-dip oxygen.', '{}'),
  ('maazah', 'wikipedia', 'Aioli', 'Aioli (Wikipedia)', 'HEALTH', 'flavor',
   'Sauce-family category page. Lemon Aioli + Chili Aioli ride this curve.', '{}'),
  ('maazah', 'google_trends', 'lentil dip', null, 'HEALTH', 'flavor',
   'Branded-category search. Direct brand-awareness lift signal — track week-over-week.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'high protein dip', null, 'HEALTH', 'flavor',
   'Category-creation term Maazah wants to own. Watch for acceleration.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'chutney', null, 'HEALTH', 'flavor',
   'Broader category-curiosity term. Spikes = "What is chutney?" content moment.', '{"geo": "US"}'),
  ('maazah', 'rss', 'https://www.ewg.org/news/feed', 'EWG News', 'HEALTH', 'flavor',
   'Clean-label + ingredient press cycles. Mainstream press picks up EWG findings within 48 hours.', '{}'),
  ('maazah', 'rss', 'https://heated.world/feed', 'Heated by Mark Bittman', 'HEALTH', 'flavor',
   'Cultural anchor for thoughtful food journalism. When Bittman covers clean-label or heritage cooking, the wellness-curious audience reads it.', '{}'),
  ('maazah', 'reddit', 'EatCheapAndHealthy', 'r/EatCheapAndHealthy', 'HEALTH', 'flavor',
   'Plant-protein + dip + meal-prep conversation density. Lentil-dip price-point discussions surface here.', '{}'),
  ('maazah', 'reddit', 'PlantBasedDiet', 'r/PlantBasedDiet', 'HEALTH', 'flavor',
   'Lentil-as-protein primary lane. Direct category education + buyer-intent.', '{}'),
  ('maazah', 'reddit', 'MealPrep', 'r/MealPrep', 'HEALTH', 'flavor',
   'Sauce-as-meal-component usage signal. "Put it on everything" content rides what this audience is making.', '{}');

-- ----- LANE 2: INGREDIENTS (Flavor Lab) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Bolani', 'Bolani (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Mom''s-recipe canonical page. Pageview velocity = Afghan-cooking mainstream-attention proxy. Direct trigger for MOM''S TABLE briefs.', '{}'),
  ('maazah', 'wikipedia', 'Falafel', 'Falafel (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Adjacent dish. Falafel-bowl content rides Roasted Red Pepper Lentil Dip usage.', '{}'),
  ('maazah', 'wikipedia', 'Tabbouleh', 'Tabbouleh (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Meal-context co-traveler for Roasted Red Pepper Lentil Dip falafel-wrap recipe.', '{}'),
  ('maazah', 'wikipedia', 'Cardamom', 'Cardamom (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Flavor-pillar spice central to Mango Chutney + heritage briefs. Spikes = baking/holiday-cooking velocity moments.', '{}'),
  ('maazah', 'wikipedia', 'Turmeric', 'Turmeric (Wikipedia)', 'INGREDIENTS', 'flavor',
   'Turmeric Ginger dip SKU pillar + wellness-trend co-traveler.', '{}'),
  ('maazah', 'google_trends', 'snackle box', null, 'INGREDIENTS', 'flavor',
   'Direct format the brand owns weekly. May 24 lakeside post hit 41 likes — recurring SKU-rotating format.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'falafel bowl', null, 'INGREDIENTS', 'flavor',
   'Recipe-context driver for Roasted Red Pepper Costco-window content.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'bolani', null, 'INGREDIENTS', 'flavor',
   'Heritage-recipe search intent. Spikes = direct T02-style brief opportunity.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'mango chutney recipe', null, 'INGREDIENTS', 'flavor',
   'SKU-direct search demand. Drives P05-style mocktail + dessert-savory crossover briefs.', '{"geo": "US"}'),
  ('maazah', 'rss', 'https://www.bonappetit.com/feed/rss', 'Bon Appétit', 'INGREDIENTS', 'flavor',
   'Cooking authority the Maazah audience trusts. Recipe-of-the-week beats inform what to ride.', '{}'),
  ('maazah', 'rss', 'https://food52.com/blog.rss', 'Food52', 'INGREDIENTS', 'flavor',
   'Catches cultural-recipe moments BA misses. Editorial taste curve overlaps with the audience.', '{}'),
  ('maazah', 'rss', 'https://cherrybombe.com/feed', 'Cherry Bombe', 'INGREDIENTS', 'flavor',
   'Heritage + women-founded food culture editorial. Direct Maazah peer-set + cultural-validation source.', '{}'),
  ('maazah', 'rss', 'https://www.saveur.com/feed/', 'Saveur', 'INGREDIENTS', 'flavor',
   'Global-cuisine + heritage editorial. Single best US source for "the world''s recipes" treatment.', '{}'),
  ('maazah', 'rss', 'https://thekitchn.com/main.rss', 'The Kitchn', 'INGREDIENTS', 'flavor',
   'Mainstream-but-tasteful kitchen content. "Would I screenshot this recipe" cohort lives here.', '{}'),
  ('maazah', 'rss', 'https://vittles.substack.com/feed', 'Vittles · UK heritage food', 'INGREDIENTS', 'flavor',
   'THE single best heritage-food Substack in English. Diaspora-identity + heritage-cooking editorial that maps to Maazah''s permission zone.', '{}'),
  ('maazah', 'rss', 'https://snaxshot.substack.com/feed', 'Snaxshot · Andrea Hernández', 'INGREDIENTS', 'flavor',
   'Highest-signal source for BFY + heritage CPG discovery. Andrea covers what the audience is finding before they know they want it. Cross Lane 4 too.', '{}'),
  ('maazah', 'reddit', 'AskCulinary', 'r/AskCulinary', 'INGREDIENTS', 'flavor',
   'Demand-side recipe questions. Surfaces what shoppers are trying to make + which usage moments need education.', '{}'),
  ('maazah', 'reddit', 'IndianFood', 'r/IndianFood', 'INGREDIENTS', 'flavor',
   'Chutney conversation native here. Cross-pollination with Afghan-American category — track recipe-shape patterns.', '{}'),
  ('maazah', 'reddit', 'cookingforbeginners', 'r/cookingforbeginners', 'INGREDIENTS', 'flavor',
   'Entry-level recipe demand. The audience asking "what do I do with this sauce I just bought" surfaces here.', '{}');

-- ----- LANE 3: PARENTING (Pulse — light coverage) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'reddit', 'lunchbox', 'r/lunchbox', 'PARENTING', 'pulse',
   'Direct dip-as-lunchbox-component context. Light-coverage lane — family is canonical origin, not target.', '{}'),
  ('maazah', 'google_trends', 'school lunch dip', null, 'PARENTING', 'pulse',
   'Kids-lunchbox usage intent term. Track August-September acceleration for back-to-school content.', '{"geo": "US"}');

-- ----- LANE 4: REVIEWS / RECS + BRAND DISCOVERY (Pulse + Shelf) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Costco', 'Costco (Wikipedia)', 'REVIEWS', 'shelf',
   'Pageview spikes = retail-discovery moments. Direct overlap with Maazah''s Midwest rollout window — track velocity.', '{}'),
  ('maazah', 'wikipedia', 'Sprouts Farmers Market', null, 'REVIEWS', 'shelf',
   'Same dynamic. Maazah is national at Sprouts since Dec 18, 2025.', '{}'),
  ('maazah', 'wikipedia', 'Whole Foods Market', null, 'REVIEWS', 'shelf',
   'Same dynamic. Maazah nationwide at WF since Nov 2024.', '{}'),
  ('maazah', 'reddit', 'Costco', 'r/Costco', 'REVIEWS', 'shelf',
   'THE highest-leverage retail-UGC subreddit for Maazah. New SKUs, hauls, region-by-region rollouts. Real-time during Costco-window.', '{}'),
  ('maazah', 'reddit', 'CostcoFinds', 'r/CostcoFinds', 'REVIEWS', 'shelf',
   'Adjacent retail-discovery community. Higher saves-per-post rate than r/Costco.', '{}'),
  ('maazah', 'reddit', 'wholefoods', 'r/wholefoods', 'REVIEWS', 'shelf',
   'Whole Foods shopper discussion. Watch for Maazah-sauce sightings nationwide.', '{}'),
  ('maazah', 'reddit', 'sprouts', 'r/sprouts', 'REVIEWS', 'shelf',
   'Sprouts shopper community. Maazah is national here — monitor mentions + new-SKU discussion.', '{}'),
  ('maazah', 'reddit', 'CPG', 'r/CPG', 'REVIEWS', 'shelf',
   'Industry-side conversation about brand launches, M&A, ambassador trends. Pre-press signal source.', '{}'),
  ('maazah', 'tiktok_cc', 'costcofind_us_7d', 'TikTok CC · #costcofind US 7d', 'REVIEWS', 'pulse',
   'Direct UGC hashtag velocity — our shoppers'' lane. Track save-driven content vs. like-driven for buyer-readable signal.', '{"region": "US", "hashtag": "costcofind", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'wholefoodshaul_us_7d', 'TikTok CC · #wholefoodshaul US 7d', 'REVIEWS', 'pulse',
   'Retailer-spotted velocity. Maazah is nationwide at WF — watch for sauce-section content.', '{"region": "US", "hashtag": "wholefoodshaul", "window": "7d"}');

-- ----- LANE 5: CULTURAL / ENTERTAINMENT / MEMES (Pulse — depth lane) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  -- Wikipedia: music + cultural figures matching Maazah's audio + heritage palette
  ('maazah', 'wikipedia', 'Roy Ayers', null, 'CULTURAL', 'pulse',
   'Maazah''s confirmed IG music palette. Pageview spike = mass-cultural music moment we can soundtrack against.', '{}'),
  ('maazah', 'wikipedia', 'John Summit', null, 'CULTURAL', 'pulse',
   'Maazah''s confirmed dance-adjacent palette. Spikes correlate with festival + dance-music moments.', '{}'),
  ('maazah', 'wikipedia', 'Khaled Hosseini', null, 'CULTURAL', 'pulse',
   'Anchor of Afghan-American cultural moments. Spike = direct heritage-permission window.', '{}'),
  ('maazah', 'wikipedia', 'Reem Assil', null, 'CULTURAL', 'pulse',
   'Arab-American food + cultural activist peer. Cookbook + restaurant moments = co-mention opportunities.', '{}'),
  ('maazah', 'wikipedia', 'Yasmin Khan (writer)', 'Yasmin Khan', 'CULTURAL', 'pulse',
   'Middle Eastern food writer. Book tour + press cycles = heritage-credibility moments.', '{}'),
  ('maazah', 'wikipedia', 'The Bear (TV series)', 'The Bear', 'CULTURAL', 'pulse',
   'Kitchen-drama + small-business resonance. The Bear final-season moments = brand-aligned cultural beats.', '{}'),
  ('maazah', 'wikipedia', 'Lapis (restaurant)', null, 'CULTURAL', 'pulse',
   'DC Afghan restaurant — cultural-peer reference. Press cycles = heritage-validation moments.', '{}'),
  -- Google Trends cultural archetypes
  ('maazah', 'google_trends', 'first gen', null, 'CULTURAL', 'pulse',
   'Maazah''s biggest cultural-permission lane. Track archetype velocity for T01-style first-gen briefs.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'immigrant kid', null, 'CULTURAL', 'pulse',
   'Adjacent first-gen archetype. TikTok content category Maazah uniquely speaks to.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'afghan american', null, 'CULTURAL', 'pulse',
   'Direct cultural-permission term. Spike = press-cycle moment.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'diaspora food', null, 'CULTURAL', 'pulse',
   'Cultural-conversation context. Drives Heritage Trace agent signal routing.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'manifestation', null, 'CULTURAL', 'pulse',
   'Entrepreneurship-coded archetype Maazah''s TikTok register pulls from (Times Square post). Use sparingly.', '{"geo": "US"}'),
  -- RSS: cultural editorial cluster
  ('maazah', 'rss', 'https://www.garbageday.email/feed', 'Garbage Day · Ryan Broderick', 'CULTURAL', 'pulse',
   'Best single source for "what meme is breaking this week." Twice-weekly read of online culture with criticism POV.', '{}'),
  ('maazah', 'rss', 'https://annehelen.substack.com/feed', 'Culture Study · Anne Helen Petersen', 'CULTURAL', 'pulse',
   'Sociological lens on millennial culture. Sunday-morning read for wellness-curious audience.', '{}'),
  ('maazah', 'rss', 'https://www.vulture.com/rss/index.xml', 'Vulture', 'CULTURAL', 'pulse',
   'NYMag''s TV/film/music vertical. Cultural-context lens for the right take, not the trade-press one.', '{}'),
  ('maazah', 'rss', 'https://www.npr.org/rss/rss.php?id=1039', 'NPR Music', 'CULTURAL', 'pulse',
   'Taste-making editorial. Tiny Desk + indie crossover credibility — Maazah''s groove-warm audio lane.', '{}'),
  ('maazah', 'rss', 'https://daily.bandcamp.com/feed', 'Bandcamp Daily', 'CULTURAL', 'pulse',
   'Weekly album-drop discovery in groove-warm + classic-funk lane. Earliest signal source.', '{}'),
  ('maazah', 'rss', 'https://www.stereogum.com/feed/', 'Stereogum', 'CULTURAL', 'pulse',
   'Indie aggregator with culture context. Cleaner register than Pitchfork for our audience.', '{}'),
  -- Reddit aggregators (Lane 5)
  ('maazah', 'reddit', 'popculturechat', 'r/popculturechat', 'CULTURAL', 'pulse',
   '3M+ pop culture aggregator. Single best subreddit for "what is the audience talking about this week."', '{}'),
  ('maazah', 'reddit', 'Fauxmoi', 'r/Fauxmoi', 'CULTURAL', 'pulse',
   'Celebrity gossip with thoughtful POV. Cultural-conversation context, not tabloid noise.', '{}'),
  ('maazah', 'reddit', 'television', 'r/television', 'CULTURAL', 'pulse',
   'Prestige TV aggregator — Bear ramp, Severance moments, food shows.', '{}'),
  ('maazah', 'reddit', 'TikTokCringe', 'r/TikTokCringe', 'CULTURAL', 'pulse',
   'TikTok meta-aggregator + viral-video surfacing. Reverse-funnel of "what just broke containment."', '{}'),
  ('maazah', 'reddit', 'AskMiddleEast', 'r/AskMiddleEast', 'CULTURAL', 'pulse',
   'Heritage-cultural-conversation context. Light volume but high-signal for diaspora identity moments.', '{}'),
  -- TikTok Creative Center
  ('maazah', 'tiktok_cc', 'food_beverage_us_7d', 'TikTok CC · Food & Beverage US 7d', 'CULTURAL', 'pulse',
   'Trending hashtags in food + beverage, US, last 7 days. Most credible "what''s happening on TikTok RIGHT NOW" — sourced from TikTok itself.', '{"region": "US", "category": "Food & Beverage", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'sounds_us_7d', 'TikTok CC · Trending Sounds US 7d', 'CULTURAL', 'pulse',
   'Audio velocity precedes meme velocity by 5-10 days. Filter for groove-warm + meme-fluent shopping-discovery audio matching Maazah''s observed TikTok lane.', '{"region": "US", "type": "sounds", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'firstgen_us_7d', 'TikTok CC · #firstgen US 7d', 'CULTURAL', 'pulse',
   'Maazah''s biggest cultural-permission hashtag. Track velocity weekly for T01-style first-gen brief windows.', '{"region": "US", "hashtag": "firstgen", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'afghanfood_us_7d', 'TikTok CC · #afghanfood US 7d', 'CULTURAL', 'pulse',
   'Direct heritage lane. Small-volume but high-signal — every spike is a brand-relevant moment.', '{"region": "US", "hashtag": "afghanfood", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'chutney_us_7d', 'TikTok CC · #chutney US 7d', 'CULTURAL', 'pulse',
   'Category-creation vocabulary. Drives "What is chutney?" pattern weekly briefs (M04 lane).', '{"region": "US", "hashtag": "chutney", "window": "7d"}'),
  -- Spotify Charts
  ('maazah', 'spotify_charts', '37i9dQZEVXbLp5XoPON0wI', 'Spotify Top 50 USA', 'CULTURAL', 'pulse',
   'Mass-culture music velocity. Cross-reference with Bandcamp + NPR Music + Stereogum for groove-warm triangulation.', '{"region": "US"}'),
  ('maazah', 'spotify_charts', '37i9dQZEVXbLZlXmNoP3ph', 'Spotify Viral 50 USA', 'CULTURAL', 'pulse',
   'Acceleration chart — what''s breaking THIS WEEK. Better leading indicator than Top 50.', '{"region": "US"}'),
  -- Apple Podcasts charts
  ('maazah', 'apple_podcasts_charts', 'society-and-culture', 'Apple Podcasts · Society & Culture US', 'CULTURAL', 'pulse',
   'What the audience is listening to, not just watching. Sunday-morning intellectual cohort.', '{"region": "US", "category": "1324"}'),
  -- Letterboxd
  ('maazah', 'letterboxd_rss', 'https://letterboxd.com/a24/rss/', 'A24 on Letterboxd', 'CULTURAL', 'pulse',
   'A24 prestige is the audience''s film palette. List updates = cultural-moment markers.', '{}'),
  -- GDELT
  ('maazah', 'gdelt', 'ENTERTAINMENT', null, 'CULTURAL', 'pulse',
   'GDELT 2.0 theme. Mass-cultural events globally within 15 minutes.', '{"theme": "ENTERTAINMENT"}'),
  ('maazah', 'gdelt', 'CULTURE', null, 'CULTURAL', 'heritage',
   'Diaspora + heritage-culture press cycles. Cross-reference with Afghan-American brand-terms.', '{"theme": "CULTURE"}');

-- ----- LANE 6: COMPETITIVE INTEL (Shelf Watch) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Sabra (company)', 'Sabra', 'COMPETITIVE', 'shelf',
   'Volume incumbent in dip set. Pageview velocity = category-cycle indicator.', '{}'),
  ('maazah', 'wikipedia', 'Fly By Jing', null, 'COMPETITIVE', 'shelf',
   'Peer + muse. Closest national-arc analog (single-founder cultural pride, Costco success). Track press + launches.', '{}'),
  ('maazah', 'wikipedia', 'Omsom', null, 'COMPETITIVE', 'shelf',
   'Sibling-founder + heritage peer. Direct playbook reference. Track launch cadence + creator program.', '{}'),
  ('maazah', 'meta_ad_library', 'Sabra', 'Meta Ad Library · Sabra', 'COMPETITIVE', 'shelf',
   'What the volume incumbent advertises + spends. Single best competitive-intel source CPG vets recognize.', '{"page_name": "Sabra"}'),
  ('maazah', 'meta_ad_library', 'HopeFoods', 'Meta Ad Library · Hope Foods', 'COMPETITIVE', 'shelf',
   'Non-hummus-dip-set expansion peer. Their ad creative = roadmap for category-creation language we should NOT mirror.', '{"page_name": "Hope Foods"}'),
  ('maazah', 'meta_ad_library', 'FlyByJing', 'Meta Ad Library · Fly By Jing', 'COMPETITIVE', 'shelf',
   'Peer + muse ad creative + spend. Watch what hooks they''re testing — most predictive of Maazah''s national-arc playbook.', '{"page_name": "Fly By Jing"}'),
  ('maazah', 'meta_ad_library', 'OmsomFoods', 'Meta Ad Library · Omsom', 'COMPETITIVE', 'shelf',
   'Sibling-founder peer creative + spend.', '{"page_name": "Omsom"}'),
  ('maazah', 'meta_ad_library', 'YoMamasFoods', 'Meta Ad Library · Yo Mama''s Foods', 'COMPETITIVE', 'shelf',
   'Premium-fridge-sauce ad signal. Different category, same buyer logic.', '{"page_name": "Yo Mamas Foods"}'),
  ('maazah', 'meta_ad_library', 'Brightland', 'Meta Ad Library · Brightland', 'COMPETITIVE', 'shelf',
   'Peer (heritage + design-led) ad creative.', '{"page_name": "Brightland"}'),
  ('maazah', 'meta_ad_library', 'GrazaOliveOil', 'Meta Ad Library · Graza', 'COMPETITIVE', 'shelf',
   'Peer (condiment-as-character) ad creative.', '{"page_name": "Graza"}'),
  ('maazah', 'press_release_rss', 'https://www.prnewswire.com/rss/consumer-products-retail/food-and-beverages-news.rss', 'PR Newswire · Food & Beverage', 'COMPETITIVE', 'shelf',
   'Every competitor launch hits here 24-72h before trade press. Half-week competitive lead time.', '{}'),
  ('maazah', 'rss', 'https://www.nosh.com/feed/', 'NOSH · BFY trade', 'COMPETITIVE', 'shelf',
   'Single best source for BFY launches in competitor category. The trade press the engine reads so the founders don''t.', '{}'),
  ('maazah', 'rss', 'https://www.foodnavigator-usa.com/Info/Latest-News-RSS', 'Food Navigator USA', 'COMPETITIVE', 'shelf',
   'Formulation + ingredient + claims press. Catches competitor reformulations + claim changes.', '{}'),
  ('maazah', 'gdelt', 'maazah_brand_mentions', 'GDELT · Maazah + competitor mentions', 'COMPETITIVE', 'shelf',
   'Daily query for brand + competitor mentions globally. Press cycles within 15 minutes.', '{"query_terms": ["Maazah", "Sajady", "Fly By Jing", "Omsom", "Sabra", "Hope Foods"]}');

-- ----- LANE 7: POLICY / REGULATORY (Heritage Trace — light) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Halal', 'Halal (Wikipedia)', 'POLICY', 'heritage',
   'Cert culture page. Spikes = certification-trend moments relevant to heritage food category.', '{}'),
  ('maazah', 'wikipedia', 'Kosher foods', null, 'POLICY', 'heritage',
   'Adjacent cert culture. Heritage-food cert context.', '{}'),
  ('maazah', 'rss', 'https://www.fda.gov/about-fda/contact-fda/stay-informed/rss-feeds/food/rss.xml', 'FDA Food Updates', 'POLICY', 'heritage',
   'Regulatory cycles affecting labeling + safety. Light coverage.', '{}');

-- ----- LANE 8: RETAIL / COMMERCE (Shelf Watch) -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Albertsons', null, 'RETAIL', 'shelf',
   'Albertsons Innovation Launchpad finalist outcome window. Track pageview spikes around award cycles.', '{}'),
  ('maazah', 'rss', 'https://progressivegrocer.com/rss.xml', 'Progressive Grocer', 'RETAIL', 'shelf',
   'Retail-buyer editorial. The voice the buyers themselves read — wholesale-lens signal calibration.', '{}'),
  ('maazah', 'rss', 'https://www.supermarketnews.com/rss.xml', 'Supermarket News', 'RETAIL', 'shelf',
   'Buyer-side trade coverage. Category-reset cycles + new-door announcements.', '{}'),
  ('maazah', 'rss', 'https://winsightgrocerybusiness.com/rss.xml', 'Winsight Grocery Business', 'RETAIL', 'shelf',
   'Convenience + grocery culture trade pub. Costco / Sprouts / Whole Foods coverage.', '{}'),
  ('maazah', 'reddit', 'grocery', 'r/grocery', 'RETAIL', 'shelf',
   'Broad retail-shopper conversation. Cross-retailer aisle discussions.', '{}'),
  ('maazah', 'reddit', 'instacart', 'r/instacart', 'RETAIL', 'shelf',
   'Delivery-driven retail discussion. Maazah shoppers via Instacart surface here.', '{}'),
  ('maazah', 'tiktok_cc', 'sproutshaul_us_7d', 'TikTok CC · #sproutshaul US 7d', 'RETAIL', 'shelf',
   'Sprouts-spotted velocity. Maazah is nationwide at Sprouts since Dec 2025.', '{"region": "US", "hashtag": "sproutshaul", "window": "7d"}'),
  ('maazah', 'trade_show', 'specialty-food-fancy-food-show', 'Specialty Food Association Fancy Food Show', 'RETAIL', 'shelf',
   'Summer NY + Winter SF. Maazah was at the July 2025 show. Track exhibitor announcements + buyer-meeting cycles.', '{"events": ["Summer Fancy Food Show NY", "Winter Fancy Food Show SF"]}'),
  ('maazah', 'trade_show', 'natural-products-expo-west', 'Natural Products Expo West', 'RETAIL', 'shelf',
   'Anaheim, March. Maazah won Booth of Year MN Pavilion 2026 + Albertsons Top 10 Launchpad. Track exhibitor list + award announcements.', '{"events": ["Expo West"]}');

-- ============================================================
-- 4. Keywords — vocabulary for tonal scoring (per pillar)
-- ============================================================
insert into pipeline.client_keywords (client_id, pillar, keyword, weight) values
  -- MAGIC IS REAL (master metaphor + milestone)
  ('maazah', 'MAGIC IS REAL', 'magic', 1.0),
  ('maazah', 'MAGIC IS REAL', 'milestone', 1.2),
  ('maazah', 'MAGIC IS REAL', 'costco', 1.5),
  ('maazah', 'MAGIC IS REAL', 'sprouts', 1.3),
  ('maazah', 'MAGIC IS REAL', 'whole foods', 1.3),
  ('maazah', 'MAGIC IS REAL', 'albertsons', 1.4),
  ('maazah', 'MAGIC IS REAL', 'expo west', 1.2),
  ('maazah', 'MAGIC IS REAL', 'fancy food show', 1.1),
  ('maazah', 'MAGIC IS REAL', 'first gen', 1.3),
  ('maazah', 'MAGIC IS REAL', 'sister founded', 1.4),
  -- PUT IT ON EVERYTHING (usage multiplication)
  ('maazah', 'PUT IT ON EVERYTHING', 'put it on', 1.5),
  ('maazah', 'PUT IT ON EVERYTHING', 'sauce', 1.0),
  ('maazah', 'PUT IT ON EVERYTHING', 'dip', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'aioli', 1.3),
  ('maazah', 'PUT IT ON EVERYTHING', 'chutney', 1.4),
  ('maazah', 'PUT IT ON EVERYTHING', 'condiment', 1.0),
  ('maazah', 'PUT IT ON EVERYTHING', 'spread', 0.9),
  ('maazah', 'PUT IT ON EVERYTHING', 'snackle box', 1.6),
  ('maazah', 'PUT IT ON EVERYTHING', 'cottage cheese', 1.1),
  ('maazah', 'PUT IT ON EVERYTHING', 'falafel', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'pizza', 0.9),
  -- MOM'S TABLE (heritage)
  ('maazah', 'MOM''S TABLE', 'afghan', 1.5),
  ('maazah', 'MOM''S TABLE', 'afghan american', 1.6),
  ('maazah', 'MOM''S TABLE', 'mom''s recipe', 1.4),
  ('maazah', 'MOM''S TABLE', 'heritage', 1.3),
  ('maazah', 'MOM''S TABLE', 'bolani', 1.5),
  ('maazah', 'MOM''S TABLE', 'kabob', 1.2),
  ('maazah', 'MOM''S TABLE', 'cardamom', 1.1),
  ('maazah', 'MOM''S TABLE', 'turmeric', 1.0),
  ('maazah', 'MOM''S TABLE', 'first gen', 1.4),
  ('maazah', 'MOM''S TABLE', 'immigrant', 1.2),
  ('maazah', 'MOM''S TABLE', 'diaspora', 1.3),
  ('maazah', 'MOM''S TABLE', 'cherry bombe', 1.2),
  -- SAUCY SQUAD (community + collab)
  ('maazah', 'SAUCY SQUAD', 'saucy', 1.2),
  ('maazah', 'SAUCY SQUAD', 'swicy', 1.5),
  ('maazah', 'SAUCY SQUAD', 'zestie bestie', 1.4),
  ('maazah', 'SAUCY SQUAD', 'haul', 1.3),
  ('maazah', 'SAUCY SQUAD', 'costco haul', 1.6),
  ('maazah', 'SAUCY SQUAD', 'ugc', 1.1),
  ('maazah', 'SAUCY SQUAD', 'belgian boys', 0.9),
  ('maazah', 'SAUCY SQUAD', 'jesse and bens', 0.9),
  ('maazah', 'SAUCY SQUAD', 'cravings by chrissy teigen', 1.0),
  ('maazah', 'SAUCY SQUAD', 'stephanies dish', 1.1),
  -- Anti-pattern downweights
  ('maazah', 'PUT IT ON EVERYTHING', 'hummus alternative', 0.3),
  ('maazah', 'MAGIC IS REAL', 'hummus alternative', 0.3),
  ('maazah', 'MOM''S TABLE', 'middle eastern', 0.6)
on conflict (client_id, pillar, keyword) do update set weight = excluded.weight;

-- ============================================================
-- 5. Schedules — per-client cron customization
-- ============================================================
-- High-frequency (every 3 hours): Reddit + TikTok CC (UGC + cultural moments are fast-decay)
-- Medium-frequency (daily, 9am ET): YouTube RSS + Pinterest + RSS news + Meta Ad Library
-- Low-frequency (weekly, Sunday 6am ET): Wikipedia pageviews + GDELT
-- Per-client overrides — defaults apply if not specified
insert into pipeline.client_schedules (client_id, source, cron) values
  ('maazah', 'reddit', '0 */3 * * *'),                  -- every 3 hours
  ('maazah', 'tiktok_cc', '0 */6 * * *'),               -- every 6 hours
  ('maazah', 'meta_ad_library', '0 13 * * *'),          -- 9am ET daily
  ('maazah', 'press_release_rss', '0 13 * * *'),        -- 9am ET daily
  ('maazah', 'rss', '0 13 * * *'),                      -- 9am ET daily
  ('maazah', 'google_trends', '0 13 * * *'),            -- 9am ET daily
  ('maazah', 'gdelt', '*/15 * * * *'),                  -- every 15 min (GDELT has 15-min refresh)
  ('maazah', 'wikipedia', '0 11 * * 0'),                -- Sunday 6am ET weekly
  ('maazah', 'spotify_charts', '0 13 * * 1'),           -- Monday 9am ET weekly
  ('maazah', 'apple_podcasts_charts', '0 13 * * 1'),    -- Monday 9am ET weekly
  ('maazah', 'letterboxd_rss', '0 13 * * 1'),           -- Monday 9am ET weekly
  ('maazah', 'youtube_rss', '0 13 * * *'),              -- 9am ET daily (when YT channels are added)
  ('maazah', 'trade_show', '0 11 1 * *')                -- 1st of month 6am ET
on conflict (client_id, source) do update set cron = excluded.cron;

-- ============================================================
-- Verification queries
-- ============================================================
-- Run these after migration to confirm Maazah is fully seeded:
--
-- select count(*) from pipeline.client_sources where client_id = 'maazah';
-- Expected: ~100 rows (broader coverage than Lil Bucks or Willa's starting seed)
--
-- select lane, count(*) from pipeline.client_sources
--   where client_id = 'maazah' group by lane order by lane;
-- Expected: all 8 lanes covered (CULTURAL ~30 — Maazah's depth lane,
--   INGREDIENTS ~17, COMPETITIVE ~14, HEALTH ~13, REVIEWS ~10,
--   RETAIL ~9, POLICY ~3, PARENTING ~2)
--
-- select agent_id, count(*) from pipeline.client_sources
--   where client_id = 'maazah' group by agent_id;
-- Expected: balanced across 6 agents
--
-- select source, count(*) from pipeline.client_sources
--   where client_id = 'maazah' group by source order by count desc;
-- Expected: rss (~14), reddit (~14), wikipedia (~21), google_trends (~12),
--   tiktok_cc (~7), meta_ad_library (~8), and the rest single-digits

-- ============================================================
-- Next steps after this migration runs:
-- 1. Worker invocation: trigger each worker once for client_id = 'maazah'
--    to backfill initial signal data
-- 2. Verify signals are landing: select count(*) from pipeline.signals
--    where client_id = 'maazah' grouped by source
-- 3. Wire dashboard's intel page to read from pipeline.signals filtered by
--    client_id = 'maazah' + status in ('fresh', 'surfaced')
-- 4. Tier 2 expansion (post-engagement):
--    - YouTube channel discovery (top 10 food creators tagged Maazah-adjacent)
--    - Apify/Playwright IG competitor scraper
--    - Threads + Bluesky APIs when stable
-- ============================================================
