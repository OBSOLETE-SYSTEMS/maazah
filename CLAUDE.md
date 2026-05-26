# Maazah Engine — Project Instructions

## What this project is

A production intelligence dashboard for Maazah (clients: Yasameen + Sheilla Sajady, founders). Built as a single-file React app (`index.html`) following the proven OBSOLETE template.

**Status (as of 2026-05-25): PITCH SPEC, not a live deployment.** Built to land the sisters on the 30-Day Quest after the Thursday May 28 pitch. Real ENCODE + OPERATE retainer flows from there. Treat all rules below as the engine's STARTING hypothesis — diagnostic with Yasameen + Sheilla refines/rewrites them.

The customer-facing positioning + opportunity read lives in `BRAND_THESIS.md` in this folder. **Read that first** if you're new to this project. This file is the operating playbook; the thesis is the strategic read.

---

## OBSOLETE Design Constitution — the three principles above all

These three principles, articulated by Ed (Alex's partner), sit ABOVE every other rule in this file. Every refresh decision, every UI choice, every brief output passes through this filter first.

### 1. Everything is designed to keep the human in control.
Yasameen + Sheilla are the operators. The engine surfaces, drafts, recommends. They review + approve + ship. The DECISIONS array is a feature — it shows the engine's calls as advisor moves they can scan, accept tacitly, or override. Visible, traceable, reversible.

### 2. Everything is designed to motivate a clear next action.
Every signal-bearing field ends with something the sisters can DO. Strategist voice, not researcher voice. *"Costco rollout is hot"* is observation. *"Drop a Roasted Red Pepper + scrambled eggs Reel Tuesday morning — Midwest shoppers who bought Saturday are looking for usage ideas right now"* is motivation.

### 3. Everything is designed to empower 1 human to do the job of 5 — at least 3 of which the human has no technical skill in.
Yasameen + Sheilla are brand-voice + retail-relationship + recipe-development operators. They're not paid-media planners, competitive analysts, Pinterest SEO strategists, TikTok format theorists, or performance-data analysts. The engine has to do those jobs IN THEIR VOICE, surface the outputs in THEIR LANGUAGE, and motivate decisions they're qualified to make.

**Pre-ship test for every artifact:**
- Can the sisters see what was decided + override it? (1)
- Does this make the next move feel obvious AND appetizing? (2)
- Does this read at operator level even if the analysis is expert-level? (3)

If any answer is no, fix before ship.

---

## Brand voice — the calibrated read

Full voice rationale lives in `BRAND_THESIS.md` → "Observed Voice Patterns" + "Voice Compass." Three non-negotiable rules during brief generation:

1. **Lowercase warmth + ALL-CAPS for emphasis — both live in the same caption.** Default body is warm sentence-case. ALL-CAPS is structural posture for milestone shouts ("NATIONWIIIIIDE"), SKU intros, and the "BIG SAUCY NEWS" announcement format. Don't all-caps everything; don't all-lowercase everything either.
2. **Sister-as-narrator is the default founder POV.** First-person plural — "my sister and I…", "we started at the farmers market…", "we took her to Costco…". Save singular "I" for personal accounts (if any).
3. **"Magic" is a master metaphor, not a verbal tic.** Audit: no more than 60% of a week's brief mix uses "magic" in the headline or first line. The word is seasoning; overuse goes hollow.

**Voice exemplars (gold standard, from @maazahmagic IG + TikTok + site, calibrated 2026-05-26):**

*Milestone shouts (caps + emoji-as-punctuation):*
- *"BIG🍃SAUCY🍃NEWS🍃 Maazah just hit Sprouts NATIONWIIIIIDE!!!!"*
- *"MAAZAH MADE IT TO TIMES SQUARE!!! 🎉 😭"*
- *"Snag all three of Maazah's magic sauces now at Whole Foods nationwide babeeee!!!!!"*

*SKU-as-character one-liners:*
- *"Meet the saucy squad:"*
- *"Chili Aioli NEW!!! (she'll ruin your life... in the best way)"*
- *"sweet + spicy = swicy"*
- *"sunshine in a squeeze"*

*Period-spaced descriptor format (TikTok category-explainer pattern):*
- *"Maazah Cilantro Chutney: Herby. Vibrant. Fresh."*
- *"Maazah Mango Chutney: Sweet. Spicy. Comforting."*

*Category-creation wordplay:*
- *"KETCHUP AIN'T GOT CHUT ON THIS"*
- *"we'll provide the chut!"*
- *"chutney was basically our ketchup"* (the killer education line)
- *"What is chutney? If you ask us, it's a magical condiment used to jazz up any meal."*
- *"It's not sorcery. Or wizardry. It's just damn good flavor."*

*Sister-narrator + family origin (canonical heritage references, NOT requiring Mom on camera):*
- *"My sister and I built Maazah inspired by Mom's recipes."*
- *"Today we took her to @costco to see it on the shelves for the first time."*
- *"the green magic that started it all"*
- *"It was our Mom's magic sauce 💚"*

*Brand-voice playfulness:*
- *"BYOS (bring your own sauce)"*
- *"courtside luxury vibes you can make at home"*
- *"Your lakeside hangs just got wayyy cooler 🏝️✨"*
- *"a full-on situation"*
- *"the dip your snackle box didn't know it was missing"*

*Manifesto / hero lines (site + entrepreneurship-coded):*
- *"MAGIC IS REAL. WE'VE TASTED IT."*
- *"Put it on EVERYTHING!"*
- *"Manifestation is real, y'all. Dream big, work hard, and watch the universe show up for you in the craziest ways"* (this entrepreneurship-coded register is TikTok-only — use sparingly and only on milestone moments)

**Two audio rosters — IG and TikTok are NOT the same lane.** Every video brief specifies a song reference (`audio` field) inside the platform-correct audio register:

**IG audio lane (groove-forward, calibrated from observed @maazahmagic IG):**
- **Groove / soul-funk** (e.g., Roy Ayers Ubiquity "Everybody Loves The Sunshine")
- **House / dance-adjacent** (e.g., John Summit "Absolutely")
- **Summer-warm originals + classic disco**
- **Original audio for sister-led POVs + collab moments**

Pattern: groove-forward + summer-warm + dance-adjacent. NOT generic wellness ambient. NOT top-40 chase.

**TikTok audio lane (meme-fluent shopping-discovery, calibrated from observed @maazahmagic TikTok):**
- **Meme audios in the shopping-discovery / "have you seen this" register** (e.g., "Oh You Cant Find This In The Store - THE TUMBLER AMBASSADOR")
- **Original audio for explainer / category-education format** (their highest-performing TikTok pattern)
- **CapCut-edited overlays with text-leading b-roll** (the actual production pattern)
- **NOT IG's Roy Ayers groove** — that lane underperforms on TikTok by an order of magnitude
- **NOT celebrity-reaction meme audios** (Taylor Swift on Fallon, Kendrick Super Bowl reaction posts both flopped on TikTok)

Pattern: meme-fluent + shopping-discovery-coded + category-teaching. The IG lane fails on TikTok, and the TikTok lane is wrong on IG. If a brief is dual-platform, draft TWO `audio` fields.

---

## Tonal Territories — the 8 lanes (cross-ref thesis)

Every cultural pulse signal passes this test: does it map to ≥1 of these?

1. **MAGIC-AS-MASTER-METAPHOR** — sauce-as-spell, drop-as-charm
2. **HERITAGE-WITH-SCALE** — Afghan flavors landing inside a Midwest weeknight
3. **SAUCY-SQUAD HUMOR** — wordplay around saucy/swicy/zestie/chut
4. **SISTERS-AT-THE-HELM** — the sibling-founder warmth
5. **MOM'S-MAGIC-GREEN** — the origin sauce, the farmers-market memory
6. **PUT-IT-ON-EVERYTHING** — usage multiplication
7. **CATEGORY-CREATION** — lentil-dip-as-new-shelf
8. **COSTCO-AISLE-MOMENT** — the retail-shelf hunt + haul reveal

If a signal doesn't fit ≥1 territory, it's not Maazah's pulse — even if it's viral.

---

## Content Pillars (4)

Pillars are the primary grouping on the Content Briefs page. Each gets a brand-palette color chip.

1. **MAGIC IS REAL** — `#6FAF4D` (Maazah kelly green). Milestone moments, founder-led storytelling, "we get to do this" energy. Hero pillar.
2. **PUT IT ON EVERYTHING** — `#D67A5A` (chili coral). Usage multiplication, the unexpected pairing. Repeat-velocity pillar.
3. **MOM'S TABLE** — `#E08642` (turmeric orange). Afghan heritage cooking, recipes from the kitchen, family + culture. Depth pillar.
4. **SAUCY SQUAD** — `#E8C547` (lemon yellow). Community, Zestie Besties, collabs, UGC amplification, retail-shelf hunts.

Each brief is tagged with one pillar. Each week's mix should hit all 4 — typical split is **PUT IT ON EVERYTHING (4-5) · SAUCY SQUAD (3-4) · MAGIC IS REAL (2-3) · MOM'S TABLE (2-3)** for a 12-14 brief week.

---

## SKU content roles

Each Maazah SKU plays a different content role. Match SKU to story type first, pillar distribution second.

### Lentil Dips (the protein/utility play — refrigerated tub format)

- **Basil Jalapeño** — the green flagship + spicy crowd-pleaser. Lead SKU for SUMMER-PARTY + GRILLING + COWBOY-CAVIAR adjacency.
- **Classic Lemon** — the everyday workhorse. Lead SKU for LUNCHBOX + WEEKDAY-SNACK + KIDS-FRIENDLY briefs.
- **Roasted Red Pepper** — **THE COSTCO HERO SKU** (May 2026). Lead SKU for COSTCO-WINDOW briefs + AIR-FRYER + SCRAMBLE + PIZZA usage.
- **Turmeric Ginger** — the wellness-forward play. Lead SKU for IMMUNITY + GOLDEN-HOUR + WHOLE-GRAIN-BOWL briefs.

### Sauces (the "put it on everything" play — squeeze bottle format)

- **Cilantro Chutney** — the ORIGINAL "mom's magic green sauce." Lead SKU for HERITAGE + MOM-RECIPE + ORIGIN-STORY briefs.
- **Lemon Aioli** — "sunshine in a squeeze." Lead SKU for FRIES + ZUCCHINI + KEBAB + the bright-yellow optimism beat.
- **Mango Chutney** — "swicy" + dessert-crossover. Lead SKU for CHEESECAKE + BAKED-BRIE + MOCKTAIL + DESSERT-SAVORY surprise briefs.
- **Chili Aioli** — **NEWEST SKU** (Dec 2025). Lead SKU for TACOS + WINGS + the "she'll ruin your life... in the best way" brand-voice payoff.

**SKU-role audit rule:** if a brief leads with Roasted Red Pepper but the recipe is a cocktail-hour mocktail, that's a mismatch — Mango Chutney owns the drink/dessert lane. Step 7 audit catches this.

---

## Top-Performer DNA — the 8 hero formats

The 8 named formats every brief gets tagged with. Engine-side scoring, single chip on the UI.

1. **sauce-pour** — close-up dollop / drizzle / spoon-out, dish reveal at the end. Default for PUT IT ON EVERYTHING.
2. **sister-led** — Yasameen and/or Sheilla on-camera, talking to camera, narrating. Default for MAGIC IS REAL + heritage beats on IG only (see Sister Rule platform split).
3. **mom-recipe** — Afghan heritage cook-along, traditional dish (Bolani, kabobs, samosas) using a recipe attributed to Mom. The DISH/RECIPE is the canonical reference — Mom is never required to appear. Default for MOM'S TABLE.
4. **shelf-spotted** — Maazah in the wild at Costco, Sprouts, friend's kitchen, snackle box on a lake. Default for at-shelf-moment / community briefs.
5. **swicy-wordplay** — text-overlay-led, brand-voice-loud, the "Chili Aioli will ruin your life" register. Default for new-SKU briefs + SAUCY SQUAD humor.
6. **collab-cameo** — Maazah + another brand co-creator (Belgian Boys, Jesse & Ben's, Cravings by CT, Stephanie's Dish, etc.). Default for SAUCY SQUAD ecosystem briefs.
7. **meme-payload** — current TikTok meme format + Maazah proof point. Reserve for moments that pass the brand vibe-test (most celebrity-reaction memes have failed for Maazah — see anti-patterns).
8. **category-explainer** ⭐ — period-spaced-descriptor format teaching the category. The "What is chutney?" pattern. Highest-engagement-on-TikTok-by-30× format for Maazah. Default for TikTok primary briefs. Saves-driven, buyer-readable proof of category authority.

### Briefing rules
- Every brief in BRIEFS must have a `dnaPattern` — one of the 8 ids above.
- Every week's mix should hit ≥6 of 8 formats. Format Mix bar on the Weekly Playbook exposes the distribution.
- At least **1 category-explainer (TikTok)** + **2 sister-led (IG)** + **1 mom-recipe** + **1 shelf-spotted** per week.
- sauce-pour is the most-used pattern (matches Maazah's actual social) — expect 4-5 per week.
- Platform-aware: every brief tagged with primary platform (IG vs. TikTok vs. dual). Audio/format calibrated to platform.

---

## The Sister Rule — on-camera policy (PLATFORM-SPECIFIC)

The observed data from @maazahmagic shows a sharp platform split: sister-led milestone content WORKS on IG (Costco-cart Reel = 426 likes) and FAILS on TikTok (same post cross-posted = 11 likes). The Sister Rule splits by platform.

**On Instagram (the sister-led platform):**
- Default to **6-8 sister-fronted IG briefs/week** (out of 12-14 total).
- Mix is roughly **2-3 together + 2-3 Yasameen solo + 2-3 Sheilla solo**, calibrated on the diagnostic to actual founder preference + bandwidth.
- The rest are hands + product + dish + text overlays (~40-50% of IG social).
- "We" / "my sister and I" / first-person plural is the default sister-led voice. Singular "I" reserved for personal accounts (if any).

**On TikTok (the category-education platform):**
- Sister-led founder content **underperforms by ~10-30×** on TikTok vs. IG. Don't default-front the sisters there.
- ≤1 sister-led TikTok brief per week unless the format is the **category-explainer** pattern (the "What is chutney?" post — 211 likes, 71 saves vs. their normal 2-11 like baseline).
- TikTok defaults to: hands + product + text overlay + period-spaced descriptors + meme-fluent audio.

**Mom / family Sajady appearance — DO NOT ASSUME (see [[no-founder-family-assumptions]]):**
- The engine NEVER drafts a brief that requires Mom or any family member to participate on camera.
- Family is canonical origin reference (public-record material — "our mom's recipe," "we grew up on this") — never required participant.
- B-roll of family kitchens, family voice memos, family photos = OPTIONAL upgrade content only. Brief MUST ship without family participation.
- Family permission gets surfaced explicitly with sisters on the diagnostic — until they open that door, treat family as off-limits for required participation.

The audit check:
- IG: <4 sister-led briefs = bug. >9 = overuse. Goal: 6-8.
- TikTok: >1 sister-led brief outside category-explainer format = bug.
- Any brief: requires Mom/family to participate = STOP, rewrite.

---

## Internal-only vs Consumer-facing (CRITICAL RULE)

Some intel fuels decisions but should NEVER ship in consumer copy. Classify before using.

### Internal-only
- Specific retail-door counts, exact Costco warehouse numbers, distributor names (KeHE, UNFI), state count growth
- Albertsons Innovation Launchpad finalist status as a *commercial* signal (winning vs. not — frame consumer-facing as "honored to be part of" energy)
- Any Maazah YoY business growth metric, revenue numbers, unit-velocity data
- Named-competitor comparisons ("Maazah vs Sabra")
- Competitor performance deltas
- Retail-buyer pitch language (the velocity numbers, the repeat-rate math, the at-shelf incrementality story)
- Pricing strategy + margin math
- Anything sourced from a retailer buyer conversation defaults to internal-only

### Consumer-facing (fair game)
- The Farsi name origin (*Maazah* = flavor/taste/joy)
- Founder names + sister duo + Afghan-American + Minneapolis + farmers-market origin
- Mom's-magic-green-sauce backstory (mom referenced lovingly, not as a marketing prop)
- The 8 SKUs by name + flavor profile + ingredient highlights
- Press citations (NYT, Food & Wine, Mpls St Paul, Forbes) — direct quotes from public reviews
- Costco / Sprouts / Whole Foods / Mariano's named as **places shoppers can find Maazah**, not as commercial wins
- Booth-of-Year (MN Pavilion) as a community/peer-recognition moment
- Chrissy Teigen + John Legend booth visit as fun moment (consumer-safe framing)
- Category critique without names ("most dip aisles are just hummus on repeat")

---

## Approved comparison pattern

When showing how Maazah is different, use **"vs. the average [category]"** framing. Never name a competitor.

- ✅ "vs. the average refrigerated dip"
- ✅ "Most dip aisles are just hummus on repeat..."
- ❌ "Maazah vs. Sabra"
- ❌ "Unlike Cedar's..."

---

## Category-creation language (gentle education, no lecture)

Lentil dip is not a known category yet. Every brief that touches the dip lineup should subtly teach without lecturing. Approved patterns:

- "Lentils — more protein, more fiber than chickpeas. Same dip joy."
- "Not hummus. Lentil dip. (There's a difference, and you can taste it.)"
- "We grew up on this dip before we knew the word for it."
- "Lentils are the rest-of-the-world's chickpea."

Don't say: "lentil dip is the new hummus" (defines by what it isn't). Don't say: "lentils are healthier than chickpeas" (consumer-facing nutrition comparison invites scrutiny). Don't lecture on lentil varieties (red lentils vs. green lentils vs. beluga — saves for occasional MOM'S TABLE deep dives).

---

## POV Discipline

### 1. Benefit-first structure
Hook = the benefit, the joke, or the provocation. Proof = the dish or the moment. Process = the recipe (only if relevant).

❌ "Lentils are sprouted and slow-cooked with Afghan spices to create a creamy dip."
✅ "Creamy + protein-packed + ready in zero minutes. Open the tub. That's it."

### 2. Sister-as-narrator (first-person plural)
Default founder POV is "we" / "my sister and I." Saves singular "I" for personal accounts.

❌ "I built Maazah from my mom's recipes."
✅ "My sister and I built Maazah from our mom's recipes."

### 3. Music-as-voice
Every video brief specifies a song reference inside Maazah's observed audio lane: groove / soul-funk (Roy Ayers) · house / dance-adjacent (John Summit) · summer-warm originals + classic disco · original audio for collabs + sister POVs. Eclectic + groove-forward. If a brief picks a trending audio outside this lane, it has to justify the fit.

### 4. Heritage specificity over generic framing
"Bolani," not "Afghan flatbread." "Auntie Fariba's kabobs," not "traditional cooking." "Our mom's green sauce," not "a family recipe." The specificity IS the brand.

### 5. The wordplay tax
Maazah's voice has a high wordplay rate (swicy, saucy squad, KETCHUP AIN'T GOT CHUT). Every brief gets ≤1 wordplay payoff. More than that and the captions read like a try-hard ad. The wordplay's power is in being earned.

### 6. Repetition is a feature — 3 core beats
Every weekly refresh's brief mix must collectively touch all 3 core beats:
- **MAGIC** — the master metaphor, the joy claim, the "magic is real" through-line
- **MOM** — the origin, the heritage, the green-sauce-from-the-farmers-market lineage
- **MULTIPLY** — the put-it-on-everything usage explosion, the repeat-conversion play

Each brief doesn't need all 3, but the week's mix must.

### 7. Lentil dip + sauce SHELF-CONTEXT discipline
Lentil dips live in the refrigerated set (next to hummus). Sauces live in the fridge or pantry (next to specialty condiments). When briefs are about shelf-finding ("find us at Costco" / "in the Sprouts produce-adjacent fridge"), specify which set so shoppers can actually locate the product. The number-one shopper complaint at category-creation brands is "I went to look and couldn't find it."

---

## Cultural Pulse — separation rule (Pulse vs. Trends)

Two intelligence streams, **zero overlap** allowed.

**TRENDS (Category + Policy + Retail)** — what's happening in the dip/sauce category, refrigerated-set dynamics, regulatory moves, retailer landscape, food press. Driven by: studies, retail-set resets, competitor moves, trade press, platform-level Pinterest/Google data, seasonal calendar cycles.

**CULTURAL_PULSE** — what's happening ON TikTok / IG / Reddit / X RIGHT NOW that Maazah can ride. Driven by: viral memes (snackle box, "things my mom said," first-gen content), viral recipes (cottage-cheese-bowl, baked feta, dip-on-everything posts), entertainment moments (NBA Finals snacks, music drops in Maazah's audio lane), cultural archetypes (Afghan-American food, lentil-dip discovery, Costco-haul reveals).

**Decision rule:** TikTok hashtag / viral recipe / specific creator post / archetype → Pulse. Research study / regulatory move / competitor press release / retail-set news / trade analysis → Trends.

---

## Sources Rule

Every TRENDS, COMPETITORS, CULTURAL_PULSE, AMBASSADORS, and WELCOME_HIGHLIGHTS card MUST render clickable source chips inline on the card face. Domain-only mono chips with full label on hover. Never hidden behind a toggle.

- **TRENDS** — minimum 2 sources per entry.
- **COMPETITORS** — minimum 1 source where we claim a specific move.
- **CULTURAL_PULSE** — minimum 1 source (TikTok hashtag, Reddit thread, article, Creative Center trend).
- **WELCOME_HIGHLIGHTS** — each cites the origin article/study.

**If you can't find a source, the signal isn't ready. Don't ship it.**

---

## Anti-patterns — what the engine never does for Maazah

- **Call Maazah "hummus" or "hummus alternative."** It's lentil dip + sauce. Don't define by what it's not.
- **Lead with "Middle Eastern" when "Afghan-American" is the truth.** The specificity IS the brand.
- **Split the sister-duo into a single face.** Yasameen AND Sheilla. Default to "we" / first-person plural.
- **Require Mom or any family member to appear on camera.** Family is canonical origin reference (recipe attributed to Mom = fine; Mom appearing on camera = OPTIONAL upgrade only, never required).
- **Overuse "magic."** Master metaphor, not verbal tic. Audit cap: 60% of week's brief mix.
- **Frame the sauces as "exotic" or "adventurous."** They're everyday. Tuesday-night chicken, not dinner party.
- **Punch at named competitors.** Category critique only. Names stay internal.
- **Treat "lentil dip" as an obvious category.** Subtly teach without lecturing.
- **Cross-post IG-formatted content to TikTok as-is.** TikTok needs its own format register — category-explainer + meme-fluent audio + text-overlay-led. The observed 10-30× engagement gap is proof.
- **Reach for celebrity-reaction meme formats on TikTok.** Taylor Swift / Kendrick reaction posts both flopped (2-4 likes). Maazah's TikTok lane is category-education, not celeb-piggyback.
- **Use generic "wellness" aesthetic.** Maazah is groove-summer-warm (IG) + meme-fluent-discovery (TikTok), not yoga-mat-clean.
- **Recipe captions that don't loop back to product use.** Dish + dip, every time.
- **Speak in supplement-brand register.** Say what the food does in food language.
- **Conflate retail rollouts with arrival.** Celebrate loud + already think about the next door.
- **Use the IG audio lane on TikTok or vice versa.** Roy Ayers groove on TikTok = flat. TikTok-meme audios on IG = chronically-online-feel. Two rosters, platform-matched.
- **Force the wordplay.** ≤1 swicy/saucy/chut payoff per brief.

---

## Weekly Refresh Ritual (placeholder — see Willa's for the full ritualized 8-step process)

This engine is a PITCH SPEC, not a live OPERATE deployment. The refresh ritual below is the spec — once the engagement signs, the live ritual mirrors the proven 8-step process from prior client engines.

**Steps (skeleton):**
1. Web search across dip/sauce/Afghan-food/TikTok/competitor lanes
2. Build 10-12 TRENDS (category + retail + competitive + trade press)
3. Update COMPETITORS array (Fly By Jing, Omsom, Hope Foods, Yo Mama's, etc.)
4. Run Cultural Pulse research (memes, recipes, entertainment, archetypes, first-gen content)
5. Generate 12-14 BRIEFS for the upcoming week, passing all voice + SKU + DNA + Sister Rule checks
6. Update WELCOME_HIGHLIGHTS + DECISIONS + TICKER + AGENTS state
7. Run Step 7 Human-Filter Audit (the 24-check audit)
8. Export weekly feedback CSV to `/MAAZAH/exports/`

### Step 7 Human-Filter Audit (full checklist — 28 checks)

Before publishing the weekly refresh, run these 28 checks:

1. Every brief has a `pillar` (one of 4)
2. Every brief has a `dnaPattern` (one of 8)
3. Format Mix: ≥6 of 8 DNA formats used this week
4. Sister Rule (IG): 6-8 sister-led IG briefs (no fewer than 4, no more than 9)
5. Sister Rule (TikTok): ≤1 sister-led TikTok brief outside category-explainer format
6. Pillar mix hits all 4 pillars
7. Big Swings: ≥3 briefs tagged as week-anchors
8. Every video brief has an `audio` field with a track inside the platform-correct lane (IG groove vs. TikTok meme-fluent)
9. ≥1 category-explainer brief (TikTok primary) in the week
10. ≥1 mom-recipe brief in the week (canonical recipe, not requiring Mom on camera)
11. ≥1 shelf-spotted brief in the week
12. Every recipe brief loops back to specific SKU usage in the caption
13. No brief uses "Middle Eastern" generically when "Afghan-American" applies
14. No brief calls Maazah "hummus" or "hummus alternative"
15. No brief names a competitor in consumer copy
16. No brief uses "magic" in the headline more than 60% of the week
17. ≤1 wordplay payoff per brief (no try-hard caption stacks)
18. Every TRENDS card has ≥2 source chips
19. Every COMPETITORS card has ≥1 source chip
20. Every CULTURAL_PULSE card has ≥1 source chip
21. WELCOME_HIGHLIGHTS each cite origin
22. The 3 core beats (MAGIC + MOM + MULTIPLY) all show up in the mix
23. The Costco-window briefs (during the Costco rollout months) appear ≥2x per week
24. Every brief that mentions a SKU spells it correctly (audit: Roasted Red Pepper, not "RRP")
25. **NO brief requires Mom Sajady or any family member to participate on camera.** Family appearances are OPTIONAL upgrade content only. Brief must ship without them.
26. **TikTok briefs use TikTok audio lane**, not IG groove audio. If dual-platform, brief has two `audio` fields.
27. **No celebrity-reaction-meme TikTok briefs** unless format passes the category-explainer test (period-spaced descriptors + brand-voice payoff).
28. No brief lifts copy verbatim from a previous week's brief (≥15-character phrase overlap check).

---

## Design system

Working palette (refines once we have Maazah's full brand kit):

| Token | Hex | Use |
|---|---|---|
| **Maazah kelly green** | `#6FAF4D` | MAGIC IS REAL pillar + primary brand color |
| **Soft lime** | `#C6E29F` | Accent + section backgrounds |
| **Ink (warm dark)** | `#2A1F12` | Body text, headlines (matches wordmark dark) |
| **Cream paper** | `#F7F3E5` | Page background (soft, label-cream warmth) |
| **Basil green** | `#87B26F` | Basil Jalapeño SKU chip |
| **Lemon yellow** | `#E8C547` | Classic Lemon + Lemon Aioli + SAUCY SQUAD pillar |
| **Roasted coral** | `#D67A5A` | Roasted Red Pepper + PUT IT ON EVERYTHING pillar |
| **Turmeric orange** | `#E08642` | Turmeric Ginger + MOM'S TABLE pillar |
| **Cilantro chutney green** | `#7FB069` | Cilantro Chutney sauce chip |
| **Mango peach** | `#E8A66F` | Mango Chutney sauce chip |
| **Chili red** | `#C84A38` | Chili Aioli (NEW) sauce chip |

**Type:**
- Display headings: a chunky retro display font matching the wordmark's vibe (Cooper Black / Bagnard / Recoleta Bold). Web font fallback: `'Cooper Std', 'Bagnard', 'Recoleta', Georgia, serif` with `font-weight: 700` and `letter-spacing: -0.02em`.
- Body: clean modern sans (`'Inter', 'Suisse Intl', system-ui, sans-serif`).
- The Farsi rendering of مزه appears at minimum once per page as a wordmark accent.

**Visual motifs:**
- Maazah arch silhouette (twin-women-under-palm) used as section frames + brief-card containers
- Cream-on-green color blocking for hero zones
- Sauce-bottle / dip-tub silhouettes as data-viz decorations (sparingly)

---

## File map

- `BRAND_THESIS.md` — the customer-facing positioning + opportunity read. The artifact Yasameen + Sheilla read before the dashboard demo.
- `CLAUDE.md` — this file. Engineering operating reference.
- `index.html` — the engine itself. Single-file React. One populated week (May 25-31, 2026).
- `(future) exports/` — weekly brief-feedback CSV exports once OPERATE goes live.
- `(future) api/` — Supabase ingestion workers if Maazah joins the multi-tenant signal pipeline post-engagement.

---

*Last updated: 2026-05-25 — Alex + Claude. V0.1 of the Maazah engine, calibrated against public sources + observed social voice from @maazahmagic. All rules above are STARTING hypotheses to refine in the 30-Day Quest diagnostic with Yasameen + Sheilla.*
