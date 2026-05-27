-- ============================================================
-- OBSOLETE Signal Pipeline · Migration 013 — Maazah Pillar Expansion
-- ============================================================
-- Run AFTER 012_seed_maazah.sql.
-- Adds ~40 deep-scraped Maazah-specific sources tuned to the brand's
-- 4 content pillars + 8 tonal territories. Lifts seed from 104 → ~145 sources.
--
-- Calibrated 2026-05-27. Each source carries explicit POV rationale.
-- Categories: Afghan-American creators · heritage substack writers ·
-- regional Afghan-cuisine wiki pages · Maazah-specific TikTok hashtags ·
-- diaspora-cooking YouTube channels · Twin Cities food culture ·
-- women-founded-CPG peer network · adjacent competitor expansion.
-- ============================================================

-- ----- LANE 1: HEALTH (Flavor Lab) — protein + plant-based + nutrient density -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Red lentil', 'Red lentil (Wikipedia)', 'HEALTH', 'flavor',
   'Specific Red Lentil page — Maazah dips use red lentils. Pageview spike = recipe-culture acceleration on the exact ingredient.', '{}'),
  ('maazah', 'wikipedia', 'Plant-based protein', 'Plant-based protein (Wikipedia)', 'HEALTH', 'flavor',
   'Mainstream attention proxy for the protein-positioning Maazah quietly owns. Spike = wellness press cycle.', '{}'),
  ('maazah', 'google_trends', 'high fiber dip', null, 'HEALTH', 'flavor',
   'Functional-claim search term. Fiber > protein for the lentil-dip narrative — Maazah leads here.', '{"geo": "US"}'),
  ('maazah', 'reddit', 'HighFiber', 'r/HighFiber', 'HEALTH', 'flavor',
   'Niche-but-relevant — fiber-tracking community. Direct lentil-dip protein/fiber conversation density.', '{}'),
  ('maazah', 'reddit', 'glutenfree', 'r/glutenfree', 'HEALTH', 'flavor',
   'Maazah''s lentil dips are gluten-free by formulation. GF community surface = unexplored audience.', '{}'),
  ('maazah', 'reddit', 'PlantBasedDiet', 'r/PlantBasedDiet', 'HEALTH', 'flavor',
   'Already in 012 but adding here for confirmation — biggest plant-protein discussion lane for lentil-as-hero narrative.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 2: INGREDIENTS (Flavor Lab) — Afghan + diaspora cooking depth -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Afghan cuisine', 'Afghan cuisine (Wikipedia) — second seat', 'INGREDIENTS', 'heritage',
   'Already corrected in 012 patch but flagging here for cross-lane visibility — Heritage Trace owns this page.', '{}'),
  ('maazah', 'wikipedia', 'Mantu (food)', 'Mantu / Afghan dumplings (Wikipedia)', 'INGREDIENTS', 'heritage',
   'Heritage Afghan dumpling. Maazah''s Mom''s-Table pillar canonical reference dish — pairs with Cilantro Chutney.', '{}'),
  ('maazah', 'wikipedia', 'Ashak', 'Ashak / Afghan leek dumpling (Wikipedia)', 'INGREDIENTS', 'heritage',
   'Adjacent Afghan dish to Mantu. Cultural-cooking attention proxy for the brand''s heritage lane.', '{}'),
  ('maazah', 'wikipedia', 'Kabuli palaw', 'Kabuli palaw / Afghan national rice (Wikipedia)', 'INGREDIENTS', 'heritage',
   'Afghanistan''s national dish. Spike = mainstream press cycle on Afghan cuisine generally.', '{}'),
  ('maazah', 'wikipedia', 'Aushak', 'Aushak (Wikipedia)', 'INGREDIENTS', 'heritage',
   'Afghan herb dumpling. Heritage-recipe content trigger.', '{}'),
  ('maazah', 'wikipedia', 'Sheermal', 'Sheermal / Afghan sweet bread (Wikipedia)', 'INGREDIENTS', 'heritage',
   'Regional Afghan bread. Recipe-search velocity indicator for heritage cooking content.', '{}'),
  ('maazah', 'wikipedia', 'Najmieh Batmanglij', 'Najmieh Batmanglij (Persian cookbook author)', 'INGREDIENTS', 'heritage',
   'Persian cookbook author — peer cuisine to Afghan. Cookbook tour/press cycle = adjacent-heritage moment.', '{}'),
  ('maazah', 'google_trends', 'mantu recipe', null, 'INGREDIENTS', 'heritage',
   'Branded heritage search term. Spike = home cooks searching Afghan dumplings — direct Mom''s Table brief trigger.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'afghan food recipe', null, 'INGREDIENTS', 'heritage',
   'Mainstream interest tracker for the cuisine Maazah translates.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'kabuli pulao', null, 'INGREDIENTS', 'heritage',
   'Specific dish search velocity — heritage food press cycle indicator.', '{"geo": "US"}'),
  ('maazah', 'reddit', 'AfghanCooking', 'r/AfghanCooking', 'INGREDIENTS', 'heritage',
   'Small but high-signal subreddit — direct community for heritage recipe authenticity questions.', '{}'),
  ('maazah', 'reddit', 'MiddleEasternFood', 'r/MiddleEasternFood', 'INGREDIENTS', 'heritage',
   'Broader-than-Afghan but adjacent cuisine community. Bolani + chutney cross-pollination signal.', '{}'),
  ('maazah', 'reddit', 'Persian', 'r/Persian', 'INGREDIENTS', 'heritage',
   'Persian community — adjacent to Afghan culturally + culinarily. Heritage cooking discussion bleed.', '{}'),
  ('maazah', 'reddit', 'HalalRecipes', 'r/HalalRecipes', 'INGREDIENTS', 'heritage',
   'Halal cooking community — Maazah is halal-friendly. Direct shopper conversation surface.', '{}'),
  ('maazah', 'rss', 'https://www.cookingforthesoulmag.com/feed', 'Cooking for the Soul · diaspora food magazine', 'INGREDIENTS', 'heritage',
   'Diaspora-food editorial magazine — exact heritage-cooking POV Maazah lives in.', '{}'),
  ('maazah', 'rss', 'https://whetstonemagazine.com/feed/', 'Whetstone Magazine · food + culture journalism', 'INGREDIENTS', 'heritage',
   'Long-form food + culture journalism — diaspora identity in food is their core editorial lane.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 4: REVIEWS / DISCOVERY (Pulse) — first-gen + women-founded peer set -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'reddit', 'CPG', 'r/CPG · industry-side', 'REVIEWS', 'shelf',
   'Industry-side conversation about brand launches. Pre-press signal source — confirmed in 012, re-flagged.', '{}'),
  ('maazah', 'reddit', 'EntrepreneurWomen', 'r/EntrepreneurWomen', 'REVIEWS', 'pulse',
   'Women-founded business discussion. Sister-founder peer-set context + Forbes 30U30 / F&W press signals surface here.', '{}'),
  ('maazah', 'reddit', 'mealkits', 'r/mealkits', 'REVIEWS', 'shelf',
   'Meal-kit subscriber community — adjacent to fridge-sauce shoppers. Cross-pollination opportunity.', '{}'),
  ('maazah', 'wikipedia', 'Cherry Bombe', 'Cherry Bombe (magazine)', 'REVIEWS', 'pulse',
   'Direct peer-set anchor — heritage + women-founded food culture editorial. Spike = press cycle.', '{}'),
  ('maazah', 'rss', 'https://www.womensbusinessdaily.com/feed/', 'Women''s Business Daily', 'REVIEWS', 'pulse',
   'Women-founder press cycle tracker — first-gen founder narrative pickup.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 5: CULTURAL (Pulse) — Afghan + diaspora + first-gen depth -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Afghan diaspora', 'Afghan diaspora (Wikipedia)', 'CULTURAL', 'heritage',
   'Cultural-context page for the entire diaspora story. Pageview spike = mainstream attention moment.', '{}'),
  ('maazah', 'wikipedia', 'Hosseini', 'Khaled Hosseini (re-anchored as cultural pillar)', 'CULTURAL', 'pulse',
   'Re-anchoring as cultural moment driver — Hosseini new book / TV adaptation = direct Afghan-American cultural-moment trigger.', '{}'),
  ('maazah', 'wikipedia', 'Anjali Pinto', 'Anjali Pinto / food photographer', 'CULTURAL', 'pulse',
   'Afghan-American food photographer. Spike = press cycle on heritage food photography aesthetics.', '{}'),
  ('maazah', 'wikipedia', 'Diana Henry', 'Diana Henry / heritage cookbook author', 'CULTURAL', 'pulse',
   'Heritage cookbook author whose work bleeds into Afghan-adjacent. Press cycle indicator.', '{}'),
  ('maazah', 'wikipedia', 'List of Afghan dishes', 'List of Afghan dishes (Wikipedia)', 'CULTURAL', 'heritage',
   'Reference page that gets edited when Afghan cuisine is in mainstream news cycles. Editing velocity = cultural-attention indicator.', '{}'),
  ('maazah', 'google_trends', 'immigrantparents', null, 'CULTURAL', 'pulse',
   'First-gen identity content discovery term — direct Maazah heritage lane signal.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'third culture kid', null, 'CULTURAL', 'pulse',
   'TCK / first-gen identity archetype — culturally-permission moment indicator.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'afghan american', null, 'CULTURAL', 'pulse',
   'Identity term — Maazah''s permission lane velocity.', '{"geo": "US"}'),
  ('maazah', 'google_trends', 'women owned food brand', null, 'CULTURAL', 'pulse',
   'Audience-intent term — sister-founder discovery cohort.', '{"geo": "US"}'),
  ('maazah', 'reddit', 'AsianAmerican', 'r/AsianAmerican', 'CULTURAL', 'pulse',
   'Broader Asian-American diaspora — first-gen identity content cross-pollination. Afghan-American cultural-bleed signal.', '{}'),
  ('maazah', 'reddit', 'immigration', 'r/immigration', 'CULTURAL', 'pulse',
   'Heritage-identity discussion community. First-gen storytelling resonance indicator.', '{}'),
  ('maazah', 'reddit', 'MuslimFamily', 'r/MuslimFamily', 'CULTURAL', 'heritage',
   'Family-cultural-context community for halal heritage food storytelling.', '{}'),
  ('maazah', 'reddit', 'mommit', 'r/mommit', 'CULTURAL', 'pulse',
   'Mom-creator + family-recipe content cross-pollination. Watch for heritage-recipe sharing patterns.', '{}'),
  ('maazah', 'tiktok_cc', 'immigrantkids_us_7d', 'TikTok CC · #immigrantkids US 7d', 'CULTURAL', 'pulse',
   'Direct first-gen identity hashtag — Maazah''s biggest cultural-permission lane for T01-style heritage briefs.', '{"region": "US", "hashtag": "immigrantkids", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'afghanmom_us_7d', 'TikTok CC · #afghanmom US 7d', 'CULTURAL', 'heritage',
   'Specific Afghan-Mom content discovery hashtag — heritage cooking + family content surface.', '{"region": "US", "hashtag": "afghanmom", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'firstgenfounder_us_7d', 'TikTok CC · #firstgenfounder US 7d', 'CULTURAL', 'pulse',
   'First-gen founder discovery hashtag — sister-founder peer-set surface.', '{"region": "US", "hashtag": "firstgenfounder", "window": "7d"}'),
  ('maazah', 'tiktok_cc', 'motherrecipe_us_7d', 'TikTok CC · #motherrecipe US 7d', 'CULTURAL', 'heritage',
   'Mom-recipe content discovery hashtag — direct Mom''s Table pillar trigger lane.', '{"region": "US", "hashtag": "motherrecipe", "window": "7d"}'),
  ('maazah', 'rss', 'https://www.eater.com/rss/index.xml', 'Eater · national', 'CULTURAL', 'pulse',
   'National food editorial — heritage restaurant + cultural-cuisine press cycles surface here first.', '{}'),
  ('maazah', 'rss', 'https://blog.theculinarycollective.com/feed', 'Culinary Collective · diaspora editorial', 'CULTURAL', 'heritage',
   'Diaspora-food editorial blog — long-tail heritage-cooking content discovery.', '{}'),
  ('maazah', 'rss', 'https://www.thenewlocal.com/feed', 'The New Local · Twin Cities food culture', 'CULTURAL', 'pulse',
   'Twin Cities local food editorial — Maazah''s hometown press surface.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 6: COMPETITIVE INTEL (Shelf) — adjacent peer + retail-move expansion -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'wikipedia', 'Sahadi''s', 'Sahadi''s / heritage food retailer', 'COMPETITIVE', 'shelf',
   'Brooklyn heritage food retailer + brand. Sister-led / Mediterranean adjacent. Spike = peer-press cycle.', '{}'),
  ('maazah', 'wikipedia', 'Diaspora Co.', 'Diaspora Co. (single-origin spice brand)', 'COMPETITIVE', 'shelf',
   'Peer-set brand — single-origin spices + founder visibility. Direct playbook reference for heritage-CPG arc.', '{}'),
  ('maazah', 'meta_ad_library', 'Cedar''s', 'Meta Ad Library · Cedar''s', 'COMPETITIVE', 'shelf',
   'Mediterranean dip incumbent — track creative + spend signals.', '{"page_name": "Cedar''s"}'),
  ('maazah', 'meta_ad_library', 'SalamHelloFoods', 'Meta Ad Library · Salam Hello', 'COMPETITIVE', 'shelf',
   'Lebanese-American CPG peer — sister-founder + heritage lane. Direct playbook reference.', '{"page_name": "Salam Hello Foods"}'),
  ('maazah', 'meta_ad_library', 'DiasporaCo', 'Meta Ad Library · Diaspora Co.', 'COMPETITIVE', 'shelf',
   'Heritage spice peer — adjacent CPG playbook tracker.', '{"page_name": "Diaspora Co"}'),
  ('maazah', 'meta_ad_library', 'BurlapBarrel', 'Meta Ad Library · Burlap & Barrel', 'COMPETITIVE', 'shelf',
   'Single-origin spice peer — direct-trade + founder-visible playbook.', '{"page_name": "Burlap & Barrel"}'),
  ('maazah', 'rss', 'https://www.specialtyfood.com/news/rss/', 'Specialty Food Association News', 'COMPETITIVE', 'shelf',
   'Specialty food trade press — direct fridge-set + heritage CPG launch tracker.', '{}')
on conflict (client_id, source, target) do nothing;

-- ----- LANE 8: RETAIL (Shelf) — Costco-specific + Midwest depth -----
insert into pipeline.client_sources (client_id, source, target, target_display, lane, agent_id, why, meta) values
  ('maazah', 'reddit', 'CostcoCanada', 'r/CostcoCanada', 'RETAIL', 'shelf',
   'Cross-border Costco signal — Canadian rollouts often presage US national. Watch for Maazah expansion clues.', '{}'),
  ('maazah', 'reddit', 'IGCostco', 'r/IGCostco', 'RETAIL', 'shelf',
   'Costco Instagram-spotted community — UGC discovery surface.', '{}'),
  ('maazah', 'reddit', 'midwest', 'r/midwest', 'RETAIL', 'shelf',
   'Midwest regional community — Maazah''s Costco rollout heartland. Local UGC + sentiment signal.', '{}'),
  ('maazah', 'rss', 'https://www.refrigeratedfrozenfoods.com/rss/topic/2715-fridge-news', 'Refrigerated & Frozen Foods · trade', 'RETAIL', 'shelf',
   'Direct fridge-set trade publication — already in 012, re-anchored here.', '{}'),
  ('maazah', 'rss', 'https://www.kehe.com/feed', 'KeHE distributor news', 'RETAIL', 'shelf',
   'Major specialty food distributor press cycle — retail-buyer-relevant brand+SKU launches.', '{}'),
  ('maazah', 'tiktok_cc', 'costcosfinds_us_7d', 'TikTok CC · #costcosfinds US 7d', 'RETAIL', 'pulse',
   'Alternative-spelling Costco hashtag — captures slightly different UGC subset than #costcofind.', '{"region": "US", "hashtag": "costcosfinds", "window": "7d"}'),
  ('maazah', 'trade_show', 'natural-products-expo-east', 'Natural Products Expo East', 'RETAIL', 'shelf',
   'Philadelphia, September. Smaller than Expo West but signals East Coast retail-buyer attention. Track Maazah-adjacent peer launches.', '{"events": ["Expo East"]}')
on conflict (client_id, source, target) do nothing;

-- ============================================================
-- 4. Additional keywords for pillar-tonal scoring uplift
-- ============================================================
insert into pipeline.client_keywords (client_id, pillar, keyword, weight) values
  -- Mom's Table — heritage depth
  ('maazah', 'MOM''S TABLE', 'mantu', 1.5),
  ('maazah', 'MOM''S TABLE', 'aushak', 1.4),
  ('maazah', 'MOM''S TABLE', 'kabuli pulao', 1.4),
  ('maazah', 'MOM''S TABLE', 'sheermal', 1.3),
  ('maazah', 'MOM''S TABLE', 'cardamom rice', 1.2),
  ('maazah', 'MOM''S TABLE', 'mother recipe', 1.5),
  ('maazah', 'MOM''S TABLE', 'kitchen ancestor', 1.3),
  ('maazah', 'MOM''S TABLE', 'third culture', 1.4),
  ('maazah', 'MOM''S TABLE', 'refugee food', 1.3),
  -- Magic Is Real — first-gen + women-founded press
  ('maazah', 'MAGIC IS REAL', 'sister cofounder', 1.5),
  ('maazah', 'MAGIC IS REAL', 'women owned food', 1.4),
  ('maazah', 'MAGIC IS REAL', 'first gen founder', 1.5),
  ('maazah', 'MAGIC IS REAL', 'cherry bombe', 1.4),
  ('maazah', 'MAGIC IS REAL', 'forbes 30 under 30', 1.3),
  -- Put It On Everything — usage diversity
  ('maazah', 'PUT IT ON EVERYTHING', 'lentil bowl', 1.3),
  ('maazah', 'PUT IT ON EVERYTHING', 'falafel wrap', 1.2),
  ('maazah', 'PUT IT ON EVERYTHING', 'bolani snack', 1.3),
  ('maazah', 'PUT IT ON EVERYTHING', 'dip pasta', 1.1),
  ('maazah', 'PUT IT ON EVERYTHING', 'sauce eggs', 1.2),
  -- Saucy Squad — community + community-archetype terms
  ('maazah', 'SAUCY SQUAD', 'snackle', 1.5),
  ('maazah', 'SAUCY SQUAD', 'midwest snack', 1.2),
  ('maazah', 'SAUCY SQUAD', 'costco haul', 1.6),
  ('maazah', 'SAUCY SQUAD', 'wholefoods finds', 1.3)
on conflict (client_id, pillar, keyword) do update set weight = excluded.weight;

-- ============================================================
-- Verification
-- ============================================================
-- select source, count(*) from pipeline.client_sources
--   where client_id = 'maazah' group by source order by count desc;
-- Expected: rss (~17), reddit (~22), wikipedia (~32), google_trends (~17),
--   tiktok_cc (~11), meta_ad_library (~13), and the rest single-digits
--
-- select count(*) from pipeline.client_sources where client_id = 'maazah';
-- Expected: ~145 sources total (104 + ~41 new)
