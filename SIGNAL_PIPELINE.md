# Maazah Signal Pipeline — Free-API Source Map

**Purpose.** Stand up Maazah as the 3rd tenant in the OBSOLETE multi-tenant Supabase signal pipeline (alongside Willa's + Lil Bucks). Goal: capture the broadest swath of internet + culture possible and tune it to Maazah's voice + tonal territories + commercial moment.

**Owner.** Alex (build), Claude (per-week refresh consuming the data).
**Status (2026-05-26).** Schema + workers + cron + scoring all live (see `~/Desktop/CODING/LILBUCKS/migrations/` + `lib/workers/`). Maazah = config seed only. Zero new engineering.

---

## The principle — comprehensive coverage across 8 signal lanes

The pipeline architecture splits SIGNALS (what the engine listens to) from CONTENT PILLARS (what the brand posts about). Watch all 8 lanes with distinct sources per lane. The Maazah seed below explicitly maps every source to a lane + agent.

| # | Lane | What it surfaces for Maazah | Maazah-tonal territories it serves |
|---|---|---|---|
| **1. HEALTH** | Lentil-as-protein, plant protein, fiber, chutney-as-functional, gut-friendly dips | Multiply · Magic |
| **2. INGREDIENTS** | Recipes (bolani, falafel, kabobs, snackle box), cardamom + saffron culture, dip-format pattern | Mom's Table · Multiply |
| **3. PARENTING** | School-lunch dip ideas, family-snack culture (light — not Maazah's primary wedge) | Mom's Table (loose) |
| **4. REVIEWS / RECS** | Costco-haul UGC, Whole Foods finds, peer-set CPG discovery, Faire + retailer mentions | Saucy Squad · Magic |
| **5. CULTURAL** | First-gen identity TikTok, Afghan diaspora food press, Cherry Bombe / Vittles editorial, music velocity, viral recipes | Mom's Table · Magic · Saucy Squad |
| **6. COMPETITIVE** | Hope Foods, Fly By Jing, Omsom, Sabra, Cedar's, Yo Mama's — launches + ad creative + press | (strategic; counter-positioning) |
| **7. POLICY** | Halal, kosher, organic certs, FDA food labeling | Heritage with scale |
| **8. RETAIL** | Costco / Sprouts / Whole Foods / Albertsons UGC + trade press + buyer signal | Saucy Squad · Magic |

**The discipline:** when seeding a new source, the curator MUST map it to one of the 8 lanes + one of Maazah's 6 agents. If a lane has zero coverage, the watchlist is incomplete.

---

## Maazah's 6 agents (mapping to the generic functions)

Same 6 generic agent functions as Lil Bucks + Willa's. Maazah-named for the brand voice on the dashboard:

| Agent ID | Function | Display Name | Focus |
|---|---|---|---|
| `flavor` | sensory | Flavor Lab | Chutney + lentil-dip + sauce category, ingredient theater, recipe pattern emergence |
| `heritage` | sustainability | Heritage Trace | Afghan-American diaspora cooking, Mom's-recipe lineage, heritage trade press |
| `pulse` | cultural | Cultural Pulse Tracker | TV/film/music/memes/archetypes, first-gen content velocity, music drops in Maazah's groove lane |
| `shelf` | competitive | Shelf Watch | Hope/Fly By Jing/Omsom/Sabra ad creative + launches; Costco/Sprouts/Whole Foods/Albertsons retail intel |
| `voice` | voice | Voice Compass | Per-brief voice audit against Voice Compass — IG groove lane vs. TikTok meme-fluent lane, ≤1 wordplay payoff, ≤60% magic-headline ratio |
| `strategist` | strategist | The Strategist | On-demand Studio riff partner; pressure-tests against the operating model; counter-scenarios |

---

## Tier 1 — the ~100-source starter watchlist (ship Maazah this week)

These are mature, free, and already-supported by the live workers. Wire them and we have a real signal pipeline running for Maazah on day 1.

### Lane 1 — HEALTH (Flavor Lab)

**Wikipedia** (pageview velocity = mainstream-attention proxy):
- *Lentil* — the category truth page. Spikes correlate with plant-protein press cycles.
- *Chutney* — the brand's master metaphor in encyclopedia form. Spike = chutney-curiosity in mainstream culture.
- *Pulse (legume)* — adjacent category page. Helps Maazah ride pulse-protein moments.
- *Hummus* — incumbent category. Spikes tell us when "the dip aisle" is heating up.
- *Aioli* — sauce-family category page.

**Google Trends:**
- *"lentil dip"* — branded-category search. Direct brand-awareness lift signal.
- *"high protein dip"* — category-creation term we want to own.
- *"plant based dip"* — adjacent intent.
- *"chutney"* — broader category interest.

**RSS:**
- *EWG News* — clean-label + ingredient press cycles.
- *Heated by Mark Bittman* — thoughtful food journalism.

**Reddit:**
- *r/EatCheapAndHealthy* — plant-protein + dip + meal-prep conversation density.
- *r/PlantBasedDiet* — lentil-as-protein primary lane.
- *r/MealPrep* — sauce-as-meal-component usage signal.

### Lane 2 — INGREDIENTS (Flavor Lab)

**Wikipedia:**
- *Bolani* — Mom's-recipe canonical page. Velocity = Afghan-cooking mainstream attention.
- *Falafel* — adjacent dish. Falafel-bowl content rides Maazah dips.
- *Tabouli* — meal-context co-traveler.
- *Cardamom*, *Turmeric*, *Cilantro* — flavor-pillar pages.
- *Snackle box* — viral-format reference page.

**Google Trends:**
- *"snackle box"* — direct format the brand owns weekly.
- *"falafel bowl"* — recipe-context driver for Roasted Red Pepper.
- *"bolani"* — heritage-recipe search intent.
- *"mango chutney recipe"* + *"lemon aioli recipe"* — SKU-direct search demand.

**RSS:**
- *Bon Appétit* — cooking authority audience trusts.
- *Food52* — culture-recipe catcher.
- *Cherry Bombe* — heritage + women-founded food culture editorial.
- *Saveur* — global-cuisine + heritage editorial.
- *The Kitchn* — mainstream-but-tasteful kitchen.
- *Vittles (Substack)* — UK heritage-cooking + diaspora identity. The single best heritage-food substack in English.
- *Diaspora Sweets (Substack)* — diaspora desserts + cultural-food essays.
- *Snaxshot · Andrea Hernández (Substack)* — THE highest-signal source for BFY + heritage CPG discovery.

**Reddit:**
- *r/AskCulinary* — demand-side recipe questions. Surfaces what shoppers are trying to make.
- *r/IndianFood* — chutney conversation native here; cross-pollination with Afghan-American category.
- *r/Cooking* — broad-recipe aggregator.

### Lane 3 — PARENTING (Cultural Pulse — light coverage)

**Reddit:**
- *r/Parenting* — school-lunch + family-meal patterns. Loose tie to brand.
- *r/lunchbox* — direct dip-as-lunchbox-component.

**Google Trends:**
- *"school lunch dip"* — kids-lunchbox usage intent.

(Light coverage — Maazah isn't a kids brand; family is canonical-origin not target audience.)

### Lane 4 — REVIEWS / RECS / BRAND DISCOVERY (Pulse + Shelf)

**Wikipedia:**
- *Costco* — pageview spikes = retail-discovery moments (rollouts, viral hauls).
- *Sprouts Farmers Market* — same dynamic.
- *Whole Foods Market* — same dynamic.

**RSS:**
- *Snaxshot · Andrea Hernández* — peer-set CPG discovery + competitive intel. Crosses Lane 4 + 6.
- *Stephanie's Dish (Substack/Fox 9)* — Twin Cities food culture; she already covered Maazah.
- *Cherry Bombe* — women-founded food brand discovery.

**Reddit:**
- *r/Costco* — THE highest-leverage retail-UGC subreddit. New SKUs, hauls, region-by-region rollouts.
- *r/CostcoFinds* — adjacent retail-discovery community.
- *r/sprouts* + *r/wholefoods* — same dynamic for adjacent retailers.
- *r/FoodFinds* — cross-retailer haul aggregation.
- *r/CPG* — industry-side launch + brand discussion.

**TikTok Creative Center:**
- *#costcofind* + *#costcofinds* — direct UGC hashtag velocity, our shoppers' lane.
- *#wholefoodshaul* + *#sproutshaul* — retailer-spotted velocity.

### Lane 5 — CULTURAL (Cultural Pulse Tracker — depth lane)

**Wikipedia (music + cultural figures matching Maazah's audio + heritage palette):**
- *Roy Ayers* — Maazah's confirmed IG music palette. Page-view spike = mass-cultural music moment we can soundtrack against.
- *John Summit* — Maazah's confirmed dance-adjacent palette.
- *Khaled Hosseini* — anchor of Afghan-American cultural moments.
- *Reem Assil* — Arab-American food + cultural activist peer.
- *Yasmin Khan* — Middle Eastern + cultural-food writer.
- *Anjali Pinto* — Afghan-American photographer + food writer.
- *The Bread Winner (film)* — Afghan cultural moment carrier.
- *Lapis (restaurant)* — DC Afghan restaurant; cultural-peer reference.

**Google Trends:**
- *"first gen"*, *"immigrant kid"*, *"third culture kid"* — first-gen archetypes Maazah uniquely speaks to.
- *"afghan american"* — direct cultural-permission term.
- *"diaspora food"* — cultural-conversation context.
- *"manifestation"* — entrepreneurship-coded archetype Maazah's TikTok register pulls from.

**RSS — cultural editorial cluster:**
- *Cherry Bombe* — heritage + women-founded food culture.
- *Vittles* — heritage-cooking + diaspora editorial.
- *NYT T Magazine* — high-aesthetic cultural lens.
- *Garbage Day · Ryan Broderick* — weekly "what meme is breaking" — culture-criticism POV.
- *Culture Study · Anne Helen Petersen* — sociological lens on millennial culture.
- *Vulture* — TV/film/music vertical with the right take.
- *NPR Music* — taste-making editorial.
- *Bandcamp Daily* — weekly album-drop discovery in groove-warm lane.
- *Stereogum* — indie aggregator with culture context.

**Reddit aggregators:**
- *r/popculturechat* — 3M+ aggregator. Best "what is the audience talking about" subreddit.
- *r/Fauxmoi* — celebrity gossip with thoughtful POV.
- *r/television* — prestige TV catcher (The Bear, Severance, etc.).
- *r/popheads* — pop music aggregator.
- *r/TikTokCringe* — TikTok meta-aggregator + viral-video surfacing.
- *r/AskMiddleEast* — heritage-cultural-conversation context.

**TikTok Creative Center:**
- *Food & Beverage US 7d* — trending hashtags in food, US, last 7 days. The credible "what's happening on TikTok RIGHT NOW" surface.
- *Trending Sounds US 7d* — audio velocity precedes meme velocity by 5-10 days.
- *#firstgen* hashtag track — Maazah's biggest cultural-permission lane.
- *#afghanfood* hashtag track — direct heritage lane.
- *#immigrantparents* hashtag track — adjacent first-gen lane.
- *#chutney* hashtag track — category-creation vocabulary.

**Spotify Charts:**
- *Spotify Top 50 USA* — mass-culture music velocity.
- *Spotify Viral 50 USA* — acceleration chart — what's breaking THIS WEEK.

**Apple Podcasts Charts:**
- *Society & Culture top 100* — what the audience is listening to. Catches the Sunday-morning intellectual cohort.

**Letterboxd:**
- *A24 on Letterboxd* — prestige-film palette the audience trusts.

**GDELT (15-min global-news cadence):**
- Theme: *ENTERTAINMENT* — mass-cultural events globally.
- Theme: *CELEBRITY* — celebrity moments + brand-cameo alerts.

### Lane 6 — COMPETITIVE INTEL (Shelf Watch)

**Wikipedia (competitor brand pages for pageview velocity):**
- *Sabra* — volume incumbent.
- *Fly By Jing* — peer + muse (closest national-arc analog).
- *Omsom* — sibling-founder + heritage peer.
- *Cedar's Mediterranean Foods* — adjacent-shelf incumbent.
- *Hope Foods* — non-hummus dip-set expansion peer.
- *Yo Mama's Foods* — premium fridge-sauce peer.

**Meta Ad Library:**
- *Sabra* — what the volume incumbent advertises + spends.
- *Hope Foods* — non-hummus-dip launch creative + spend.
- *Fly By Jing* — peer creative + spend.
- *Omsom* — peer creative + spend.
- *Yo Mama's* — premium-fridge-sauce ad signal.
- *Brightland* — peer (heritage + design-led) creative + spend.
- *Graza* — peer (condiment-as-character) creative + spend.
- *Cedar's* — competitor at shelf.
- *Salam Hello* — Levantine peer.

**Press Release RSS:**
- *PR Newswire Food & Beverage* — competitor launches 24-72 hrs before trade press.

**RSS — trade press:**
- *NOSH (BFY trade)* — BFY launch coverage.
- *Food Navigator USA* — formulation + ingredient + claims press.
- *Refrigerated & Frozen Foods* — direct shelf-set trade pub.
- *Specialty Food News* — Specialty Food Association trade.
- *Progressive Grocer* — retail-buyer-side editorial.
- *Supermarket News* — buyer-side coverage.

**GDELT:**
- Brand + competitor mentions query — Maazah, Sajady, Hope Foods, Fly By Jing, Omsom mentioned in press cycles globally within 15 minutes.

### Lane 7 — POLICY / REGULATORY (Heritage Trace — light)

**Wikipedia:**
- *Halal certification*, *Kosher certification*, *USDA Organic* — cert culture pages.

**RSS:**
- *FDA Food updates*, *USDA Food Safety* — regulatory cycles.
- *Specialty Food Association policy* — trade-side policy.

(Light coverage — not Maazah's primary lane.)

### Lane 8 — RETAIL / COMMERCE (Shelf Watch)

**Wikipedia:**
- *Costco*, *Sprouts Farmers Market*, *Whole Foods Market*, *Albertsons* — retailer pages.

**RSS:**
- *Progressive Grocer* — retail buyer editorial.
- *Supermarket News* — buyer-side trade.
- *Winsight Grocery Business* — convenience + grocery culture.
- *NACS Magazine* — convenience-store trade (loose).
- *Press Release RSS* (PR Newswire Retail) — retailer launches + extensions.

**Reddit:**
- *r/Costco* (overlap with Lane 4 — Lane 8 emphasizes retail-trade vs. shopper-UGC angle).
- *r/grocery* — broad retail-shopper conversation.
- *r/instacart* — delivery-driven retail discussion.

**TikTok Creative Center:**
- *#costcofind*, *#sprouts*, *#wholefoodshaul*, *#targetfinds*, *#aldifinds* — retail-discovery hashtag velocity.

**Trade Show (manually-curated exhibitor lists):**
- *Specialty Food Association Fancy Food Show* (Summer NY + Winter SF) — Maazah was just there July '25.
- *Expo West* (Anaheim, March) — Maazah won Booth of Year MN Pavilion '26.
- *Sweets & Snacks Expo* (Indianapolis, May).
- *PLMA Private Label Trade Show* (Chicago, November).

---

## Tier 2 — Maazah-specific upgrades (post-engagement)

Once Tier 1 is running for 2-3 weeks, add:

- **Apify / Playwright Instagram scraper** — competitor IG accounts + collab-graph creator accounts + retailer-buyer-relevant accounts.
- **Threads (Meta) API** — text-platform discovery for first-gen + food-creator chatter.
- **Bluesky API** — food writers + journalists migrating off X.
- **TikTok creator-specific feeds** — Stephanie's Dish, gvang101, and 6-8 mid-tier Twin Cities + Costco-haul creators.
- **Substack RSS expansion** — Bake from Scratch, Whetstone Mag, Bittman's Heated already in Tier 1; add long-tail heritage-food substacks.
- **Wikipedia changes API** — edits to chutney / lentil dip / Afghan cuisine / hummus pages = cultural-attention signal.

---

## Scoring tweaks (Maazah-specific)

The pipeline's generic scoring (`signals_scored` view) decays by 3-day half-life × `metric_score × client_tonal`. Maazah-specific tuning lives in `client_keywords`:

**Weight boosts (Maazah-specific):**
- *chutney, lentil dip, costco, snackle box, first-gen, afghan, sister-founded, mom's recipe* → boost 1.5×
- *hummus alternative* → DOWNWEIGHT 0.3× (anti-pattern — don't surface signals that define-by-negation)
- *celebrity reaction, taylor swift, kendrick lamar* → DOWNWEIGHT 0.5× (Maazah's TikTok celebrity-reaction posts flopped, anti-pattern flagged)
- *saves > likes, save velocity, save rate* → boost 2× (saves = buyer-readable category-authority signal)

**Brand-mention overlay:** every signal cross-referenced against brand_terms. Brand-mention signals route to a dedicated dashboard alert lane regardless of pillar/lane.

**Competitor-mention overlay:** every signal cross-referenced against competitor_terms. Competitor signals route to the Shelf Watch agent for the Decisions feed (internal-only — never to consumer-facing surfaces).

---

## The seed migration

Live in `migrations/012_seed_maazah.sql` (this folder). To run:

```bash
psql $SUPABASE_DB_URL < migrations/012_seed_maazah.sql
```

Then verify:

```sql
select count(*) from pipeline.client_sources where client_id = 'maazah';
-- Expected: ~50 rows
select agent_id, count(*) from pipeline.client_sources
  where client_id = 'maazah' group by agent_id;
-- Expected: balanced distribution across agents
```

---

## What Maazah gets from running this

**Day 1 (after seed):** the engine is listening on ~50 sources for Maazah. Signals start landing in `pipeline.signals` within minutes.

**Week 1:** the weekly refresh has real data — not just Claude's WebSearch — to draw from. TRENDS array populated from actual Reddit + Pinterest + Google Trends velocity. CULTURAL_PULSE populated from TikTok Creative Center + Spotify Charts + GDELT. COMPETITORS populated from Meta Ad Library + PR Newswire.

**Week 2-4:** signal-to-brief routing tightens. Voice Compass refines per Maazah's actual feedback CSV. The Wholesale Lens metrics get tracked over time (not just snapshot).

**Month 2:** Maazah has 60 days of signal history. Engine can compare week-over-week velocity, detect emerging vs. fading patterns, surface "this trend is new this week" vs. "this is at peak and decaying."

**Month 3:** Multi-tenant pipeline value compounds. When a trend hits both Lil Bucks + Maazah signal sources, it's likely a real cultural moment (not platform noise). Cross-tenant validation tightens accuracy.

---

*Authored 2026-05-26 by OBSOLETE. Schema lives at `~/Desktop/CODING/LILBUCKS/migrations/001_pipeline_schema.sql`. Workers live at `~/Desktop/CODING/LILBUCKS/lib/workers/`. Maazah seed lives at `~/Desktop/CODING/MAAZAH/migrations/012_seed_maazah.sql`.*
