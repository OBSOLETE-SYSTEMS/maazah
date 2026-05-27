# MAAZAH ENGINE — STRUCTURE PORT FROM LIL BUCKS

**Brief for:** the Claude Code instance working on the Maazah engine
**From:** the Claude Code instance that just finished the Lil Bucks engine
**Date:** 2026-05-26
**Goal:** apply every structural pattern from the Lil Bucks engine to Maazah, WITHOUT touching Maazah's existing brand voice, pillars, DNA, or signal pipeline.

---

## TL;DR

Lil Bucks's engine got 60+ commits of UX/UI work that we want Maazah to inherit. The CONTENT (voice, pillars, sources, DNA, brand colors) stays Maazah's — the STRUCTURE (layout, modals, accordions, scoring system, animation patterns) gets ported verbatim.

**Read the Lil Bucks reference file in full before you start:**
- `/Users/Alex.Maikowski/Desktop/CODING/LILBUCKS/index.html` (~4900 lines, single-file React app)
- `/Users/Alex.Maikowski/Desktop/CODING/LILBUCKS/api/studio.js` (Gemini Strategist)
- `/Users/Alex.Maikowski/Desktop/CODING/LILBUCKS/api/voice-compass.js`
- `/Users/Alex.Maikowski/Desktop/CODING/LILBUCKS/api/panel.js`
- `/Users/Alex.Maikowski/Desktop/CODING/LILBUCKS/api/counter-strike.js`
- `/Users/Alex.Maikowski/Desktop/CODING/LILBUCKS/vercel.json`

---

## 🛑 DO NOT TOUCH — preserve Maazah's identity

Before you change anything, read Maazah's existing files to understand what's already established:
- `/Users/Alex.Maikowski/Desktop/CODING/MAAZAH/CLAUDE.md`
- `/Users/Alex.Maikowski/Desktop/CODING/MAAZAH/BRAND_THESIS.md`
- `/Users/Alex.Maikowski/Desktop/CODING/MAAZAH/SIGNAL_PIPELINE.md`
- `/Users/Alex.Maikowski/Desktop/CODING/MAAZAH/index.html` (current state)

**Don't change:**
1. **Brand voice / tone** — Yasameen + Sheilla Sajady's Afghan-American family-warm register. Use what Maazah's CLAUDE.md defines.
2. **Content pillars** — whatever Maazah currently has (probably different from Lil Bucks's FUEL / THE BOWL / SOIL / CRUNCH BUNCH). Keep them.
3. **DNA formats / hero post types** — Maazah's own list.
4. **Tonal territories** — Maazah's emotional/thematic register.
5. **Signal pipeline + sources** — Maazah has its own. Don't replace with Lil Bucks's.
6. **Founder narrative** — Yasameen + Sheilla Sajady, Afghan-American sauces + lentil dips. The Christina-intro context (per memory: she made the warm intro but do NOT reference Christina in any user-facing copy).
7. **Brand colors** — Maazah's palette (likely warm/earthy/spice-coded vs. Lil Bucks's cobalt-magenta-butter). The DESIGN SYSTEM ports — the SPECIFIC HEX VALUES come from Maazah.
8. **Pitch posture** — per memory, Maazah's wedge is the "blank-page + buyer-signal" hypothesis-mode framing. Where Lil Bucks reads as a confident operator, Maazah should read as a thoughtful strategist asking the founders to validate the hypothesis. This affects:
   - Memo language (more hypothesis, less declaration)
   - Diagnostic Inbox framing (more "tell us about your business," less "we already know")
   - How It Works copy (more "here's what we're proposing," less "here's what we built")

---

## ✅ WHAT TO PORT — phased plan

Work in this order. Test each phase in the browser before moving on. Commit after each phase.

### Phase 1: Foundation (app shell + design system)

**1.1 — Design tokens (CSS `:root` block)**
Port the Lil Bucks token structure (NOT the values):
```css
:root {
  --brand-primary: <Maazah primary>;
  --brand-deep:    <Maazah primary deeper>;
  --brand-accent:  <Maazah accent / magenta-equivalent>;
  --brand-light:   <Maazah light/cream>;
  --butter:        <Maazah cream-equivalent>;
  --butter-light:  <Maazah cream-light>;
  --butter-deep:   <Maazah cream-deep>;
  --ink:           <Maazah body text>;
  --ink-soft:      <Maazah soft body>;
  --border:        <Maazah border>;
  /* Pillar colors — one per Maazah pillar */
  --pillar-1: <hex>;
  --pillar-2: <hex>;
  --pillar-3: <hex>;
  --pillar-4: <hex>;
}
```
Pull the actual hex values from Maazah's BRAND_THESIS.md or existing index.html. If Maazah doesn't have a defined palette yet, propose one rooted in Afghan-American food culture (warm earth tones, saffron, cardamom, deep red — but check with Alex first).

**1.2 — Font stack**
Port the same 4-font system used in Lil Bucks (Google Fonts CDN):
- `Lilita One` — chunky display (headlines, big numerals)
- `Fraunces` — italic body serif (descriptions, deks)
- `Inter` — sans-serif body (UI text)
- `JetBrains Mono` — code/eyebrow tags

If Maazah has a different brand font, use it for headlines but keep Fraunces/Inter/Mono for the rest — the typographic hierarchy is what matters.

**1.3 — App shell layout**
Grid: 200px sidebar + 1fr main. ErrorBoundary class wrapping `<App/>` (see Lil Bucks line ~4500).

Sidebar contents:
- Brand logo block (LIL BUCKS → MAAZAH logo)
- Brand name + sub
- Nav items: Intelligence Brief · Content Briefs · Studio · Calendar (WIP) · Performance (WIP)
- Diagnostic Inbox button (magenta gradient pill near bottom)
- `↓ how it works` small link

Main:
- `.page-head` with h1 + italic dek + Live pill (right-aligned)
- Ticker (animated horizontal scroll, color-coded dots by signal type)
- Section content
- Footer signature

**1.4 — ErrorBoundary**
Port the `class ErrorBoundary extends React.Component` block verbatim (Lil Bucks line ~4475). Wrap `<App/>` in `<ErrorBoundary><App/></ErrorBoundary>`. Update the fallback copy to reference Maazah's brand.

---

### Phase 2: Monday Memo modal (auto-opens on load)

Lil Bucks reference: `function MondayMemoModal({onClose, onShipIt})` near line 2380.

Structure:
- Tricolor gradient hero (cobalt-deep → magenta-deep + butter accent) — adapt to Maazah's palette
- Date pill (top-left) + "The Monday Memo" Lilita One title + signature
- 3 body sections:
  1. **THE READ** — pullquote in bordered box + 3 labeled subsections (What's happening · Maazah's edge · This week's job)
  2. **5 SIGNALS DRIVING THE WEEK** — pulled from WELCOME_HIGHLIGHTS array
  3. **3 RECOMMENDED MOVES** — pulled from WELCOME_MOVES array
- Footer CTA: "SEE THIS WEEK'S ENGINE →" closes modal + lands on Intel Brief

State: `memoOpen` defaults to `true`. Modal auto-opens on first load.

**Maazah-specific adaptation:** the THE READ language should feel more hypothesis-mode ("Here's our read — does this match what you're seeing?") rather than declarative.

---

### Phase 3: Intelligence Brief tab

Reference: `function IntelligenceBrief` near line 2945.

**3.1 — Memo trigger button at top**
Cobalt→cobalt-light gradient pill with magenta "Open Memo" sub-button. Click → opens MondayMemoModal.

**3.2 — Five subtabs:**
- Cultural Pulse (count badge)
- Category + Policy
- Competitor Watch
- Counter-Strike (⚡ badge)
- Brand Ambassadors

**3.3 — Culture Momentum view (top of Pulse subtab)**
- Title: "What's popping. What's cooling."
- Two columns side-by-side, 3 items each (use `.slice(0,3)` on each)
- Each item: green/orange momentum chip + signal label + "how we ride" or "why we skip" note

**3.4 — Intel cards (Pulse / Trends / Comps)**
Every intel card now has:
- 5px left color rail (velocity color for Pulse, pillar color for Trends, direction color for Comps)
- 32px tinted glyph badge in card-head (top-left)
- Type/eyebrow + velocity badge
- Hook (Fraunces serif)
- Detail paragraph
- "Lil Bucks Play" / "Engine Angle" / "Opportunity" highlighted box → rename to Maazah's brand voice equivalent
- DNA chip + platform chip + clickable drove-chip (jumps to brief)
- Source chips (domain pills)
- Right-aligned "↓ Send to Studio" magenta pill

Glyph maps to port (adapt to Maazah's signal types):
```js
const PULSE_TYPE_GLYPH = {
  "MEME TEMPLATE":"🎭", "VIRAL RECIPE":"🍳", "MISINFORMATION REBUTTAL":"🛡️",
  "NEWS CYCLE":"📰", "CULTURAL CONVERSATION":"💬", "ENTERTAINMENT MOMENT":"🎬"
};
const VELOCITY_RAIL = { "high":"#EA7E9A", "medium":"#F4B73E" };
const PILLAR_GLYPH = { /* one glyph per Maazah pillar */ };
```

**3.5 — Competitor cards — direction badge**
Replace the inline arrow with a chunky pill: "Heating up" (red), "Cooling" (green), "Flat" (gray). Use `.comp-dir-badge` class.

**3.6 — Counter-Strike Log**
Native `<details>` accordion per entry. Collapsed shows: trigger date + competitor name + 1-line detail + response-time badge + status chip. Expanded shows full briefs.

**3.7 — Editorial spread for Competitor Watch**
Three-column "this week on the shelf" lede with: ↩ What happened (cobalt) · → What's coming (butter) · ⚡ The plays this week (magenta). Tricolor gradient rule under header. Pull from a `COMP_WEEKLY_POV` object.

**3.8 — Brand Ambassadors grid**
Clickable cards (whole card is `<a href={a.url}>`). Pillar tint left rail (green for active, butter for watch). Avatar gradient. Handle + name+focus + reach chip + notes. Status pill: "✓ active" / "👁 watching". WIP banner at top of section.

---

### Phase 4: Content Briefs tab + Conviction Score

Reference: `function ContentBriefs` near line 3060.

**4.1 — Ride-now hero**
Single card at top: cobalt→magenta gradient. Magenta pill counter with `⚡` icon + the count. Title: "RIDE-NOW BEATS THIS WEEK". Sub: "culturally decay-sensitive · produce + post before the window closes". Right-aligned mini-line: "{total} total briefs · {scripted} scripted video".

**4.2 — Pillar sections**
Group briefs by Maazah's pillars. Each section has a swatch + name header (Fraunces 17px) + 3-column grid of brief cards.

**4.3 — Brief cards**
Each card:
- 5px pillar-color left rail
- Top row: DNA glyph badge (34px, pillar-tinted) + Conviction chip + Platform chip
- Concept text (Fraunces 14px)
- Bottom row: DNA tag (cobalt pill) + Flavor/Product tag (magenta pill) + timing

**4.4 — Conviction Score system (CRITICAL — port this verbatim then calibrate)**

```js
const CONVICTION_INPUTS = {
  "BRIEFID-1": { voice:92, panel:84, pulse:91, recency:13 },
  // ... one entry per Maazah brief
};
function getConviction(briefId){
  const c = CONVICTION_INPUTS[briefId];
  if(!c) return null;
  const base = Math.round((c.voice + c.panel + c.pulse) / 3);
  const score = base + c.recency;
  const band = score >= 85 ? "HIGH" : score >= 70 ? "MEDIUM" : "WATCH";
  return { ...c, base, score, band };
}
```

Then craft the `ConvictionChip` component with hover tooltip showing the 4-component breakdown + math + verdict line. See Lil Bucks line ~1898 area.

**Calibrate the conviction scores per Maazah brief honestly** — high for the briefs you'd ship first, medium for solid ones, watch for the hedge bets. Don't make them all HIGH or it loses meaning.

Sort briefs within each pillar by conviction descending: `g.briefs.sort((a,b)=>(getConviction(b.id)?.score||0)-(getConviction(a.id)?.score||0))`.

---

### Phase 5: Brief Detail Modal

Reference: `function BriefDetailModal` near line 3135.

Modal sections in order:
1. **Header chip row** — Conviction + Platform + Flavor + DNA + Timing
2. **Intel that drove this** — clickable rows linking back to source Trends/Pulse/Comps
3. **Alt hooks** — 3 hook options, recommended one tagged
4. **Phone shot list** — swipeable phone-frame carousel showing each scene (PhoneShotList component, ~line 2700)
5. **Captions · 3 variants** — Direct / Warm / Punchy with copy button
6. **🎬 Production** — collapsible `<details>` (Visual direction + End-card stinger)
7. **⚡ Amplify** — collapsible `<details>` (paid media plan from AMPLIFY_PLANS map)
8. **Footage Inspo** — toggle-based 4-column grid (SHOOT THIS · FOUND/STITCH · GIF/MEME · ARCHIVE)
9. **Crunch Bunch Panel** — lazy-loaded behind a "▷ Run pre-test" button (DON'T auto-fire)
10. **Send to Studio CTA** — bottom row, opens Studio with smart seed

**Send-to-Studio seed format:**
```
I want to sharpen brief {id}: "{concept}".

Recommended hook: "{hook}"
Platform: {platform} · Pillar: {pillar} · Flavor: {flavor}

Where can this land harder?
```

---

### Phase 6: Studio modal (Gemini-powered chat)

Reference: `function StudioModal` near line 4015, and `/api/studio.js`.

**6.1 — API endpoint** (`api/studio.js`)
- Use **Gemini 2.5 Flash** with `thinkingBudget:0` — CRITICAL for speed. Without it Flash burns 10-20s on internal thinking before responding.
- Endpoint: `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent`
- Env var: read both `GEMINI_API_KEY` and `GEMINI_API_Key` (case-tolerant chain — Alex's Vercel var is capitalized weirdly)
- `MAX_TOKENS: 500` (NOT 1000 — too verbose at 1000)
- System prompt with the **CRITICAL brevity section** that I'll quote in full at the end of this brief

**6.2 — Vercel config** (`vercel.json`)
```json
"functions": {
  "api/studio.js":         { "maxDuration": 60 },
  "api/voice-compass.js":  { "maxDuration": 60 },
  "api/panel.js":          { "maxDuration": 60 },
  "api/counter-strike.js": { "maxDuration": 60 }
}
```

**6.3 — Modal frontend**
- Header: glyph icon + "The Strategist" title + sub ("Live · Gemini 2.5 Flash · full Maazah engine context loaded") + Chat/Voice Compass toggle + close
- Welcome state (no messages yet): eyebrow "// ASK ME ANYTHING ABOUT MAAZAH" + 4 starter cards with glyphs + arrow
- Chat messages: user (magenta bubble, right-aligned) · assistant (white bubble with cobalt border, left-aligned)
- **Markdown renderer** for assistant messages — port `renderStudioMarkdown` + `renderStudioInline` helpers verbatim (Lil Bucks line ~4000). Wrap in try/catch in the render call.
- **Voice mic button** between textarea and Send. Uses `window.SpeechRecognition || window.webkitSpeechRecognition`. Click 🎙️ → live transcribe into textarea, click again → stops + user reviews + clicks Send. See Lil Bucks line ~4060 for the implementation. Helper hint above input row explaining what voice does.
- **Smart seed support:** accept `initialSeed` prop, auto-fire send(seed) once on mount via `seedFiredRef` guard.
- Frontend message-history cap: only send last 8 turns to API.
- 55s AbortController timeout on fetch.

**6.4 — Voice Compass mode**
Same modal, second mode. Caption input → scores against the brand voice fingerprint (8 tonal territories + anti-patterns + platform fit). API: `/api/voice-compass.js` (Claude Sonnet 4.6, JSON output). Voice Compass STAYS on Claude because the structured JSON output benefits from Sonnet's reasoning. See Lil Bucks api/voice-compass.js for the system prompt structure — adapt to Maazah's voice fingerprint.

---

### Phase 7: Diagnostic Inbox

Reference: `function DiagnosticInbox` near line 2700, and the modal wrapper `DiagnosticInboxModal` near 2425.

**7.1 — Three questions** — operational reality only the founders know
Maazah-adapted questions (suggestions, calibrate to Maazah's reality):
1. **ON-THE-GROUND** (📍 green rail) — sampling events, retailer demos, family-kitchen content shoots
2. **ORBIT THE MOMENT** (🎙️ butter rail) — PR / podcast / press appearances
3. **MOOD DIAL** (🎚️ magenta rail) — warmer founder-voice vs. sharper category-fight

**7.2 — Submit flow** — multi-stage
- Click option → highlights magenta but NOT yet locked
- If `needsDetail: true`, textarea appears with smart placeholder
- Two buttons: "Lock it in →" (magenta) and "Skip note" (gray)
- After submit: green LOCKED IN pill + cream note panel preserving the text + ↺ "change my answer" button

**7.3 — Free-form catch-all (4th card)**
Below the 3 structured questions. 💭 glyph · cobalt rail · "ANYTHING ELSE" eyebrow. Big textarea. Submit button. On submit: ✓ NOTED + note preserved + ↺ edit.

Use `answers[qid] = { value, label, note, locked }` state shape.

---

### Phase 8: How It Works tab

Reference: `function HowItWorksTab` near line 4250.

**8.1 — Hero**
Cobalt→magenta gradient. Eyebrow + single Lilita One headline + stats stripped (we dropped them). Format: `Your monday opens with the brief, not the research.` (one line at 32px — adapt to Maazah's voice).

**8.2 — 4-step flow band**
4 columns, gap:1px, cobalt border. Step 04 is magenta (the "you" step). Each step has dashed-underline counter row + Lilita One name + Fraunces body. Arrow circles between steps.

Steps: 01 Listen · 02 Calibrate · 03 Brief · 04 Produce (your team takes it from here)

**8.3 — Engine Thinking Flow (the centerpiece)**
This is THE differentiator. Port carefully.

Pipeline visualization:
- 7 circular nodes connected by horizontal rail
- Rail fills cobalt→magenta gradient as user clicks through
- Active node: magenta, scaled 1.15x, pulsing glow ring
- Done nodes: solid cobalt with ✓
- Smooth cubic-bezier transitions

Per-step card shows:
- Agent icon + name + focus + step counter
- **Watches chips** — list of sources/tools the agent uses
- "Incoming from {prev agent}" pill (steps 2-7)
- Title + What (one sentence)
- Filters + checks (2-3 bullets max)
- Verdict box (green gradient)

Steps map to Maazah's agent roster. Port the data structure from Lil Bucks (line ~4150):
```js
const ENGINE_THINKING_STEPS = [
  { id:1, agent:"...", icon:"...", title:"Signal detected", focus:"...", watches:[...], what:"...", filters:[...], verdict:"..." },
  ...
];
```

Tell a SPECIFIC story end-to-end — one signal → one brief. The Lil Bucks story is "cottage-cheese bowl revival hits TikTok → cheese-Marcus persona scores it → brief drafted → shipped." Build a Maazah equivalent.

**8.4 — Four collapsible accordions**
Below the Engine Thinking Flow, four `<details>` accordions:
1. **Calls the engine made this week** (DECISIONS array) — verb-led decisions: PROMOTED · KILLED · QUEUED · ESCALATED
2. **Receipts** (RECEIPTS array) — engine track record · filter chips
3. **The brand fence** (ANTI_PATTERNS array) — what the engine refuses to do · 12-13 entries · filter by category
4. **Sources + Brand DNA** — twin accordions at the bottom

---

### Phase 9: Calendar + Performance previews

Reference: `function CalendarPreview` + `PerformancePreview` near line 2675.

**9.1 — Both tabs sit under sidebar nav with `WIP` chip tags.**

**9.2 — Top of each: 🚧 UNDER CONSTRUCTION banner**
Magenta-dashed border on cream-light wash. Tag pill + body text explaining "A preview of what's coming · [features]. Below is FPO content so you can see the shape."

**9.3 — Calendar:** 7-day grid, mock slots per day, format-mix bar + paid-amp markers in footer.

**9.4 — Performance:** 4 KPI tiles showing `—` (no data yet) with a faded "SOON" Lilita One watermark behind each. Results-grid placeholder below.

---

### Phase 10: Polish + footer

**10.1 — Main footer**
Bottom of every page. JetBrains Mono 10px line:
`<strong>Maazah Engine</strong> · OBSOLETE V0.1 · refreshed {date} · powered by Gemini 2.5 Flash + Claude Sonnet 4.6`

**10.2 — Ticker color-coded dots**
- 🔵 signal (cobalt) — trends, data
- 🌸 pulse (magenta) — cultural moments
- 🟡 decision (butter) — engine calls
- 🟢 win (green) — Maazah positioning wins
- 🟠 warning — flags

Animation speed: `animation:scroll 19s linear infinite` (20% faster than the original).

**10.3 — Responsive breakpoint (max-width: 820px)**
Sidebar collapses to horizontal top nav · grid-2/grid-3 → single column · memo trigger stacks · ride-hero stacks · ETF node labels hide. See Lil Bucks line ~132.

**10.4 — Mobile fallback**
`body { overflow-x: hidden }` as safety net.

---

## 🎯 Critical patterns to port verbatim

These are non-negotiable. Copy-paste from Lil Bucks.

### A. Studio system prompt brevity rule
The Studio is conversational, not a memo writer. Quote in full:

```
## RESPONSE STYLE — CRITICAL · READ THIS FIRST

**Default mode: short, conversational, punchy.** You are texting with the founder, not writing a deck.

- **Target length: 60-120 words for most replies.** Hard ceiling: 200 words.
- **Lead with the call.** First sentence is the recommendation. Then 1-2 sentences of why. Done.
- **No headers, no bullet hierarchies, no labeled sections** (Platform: / Hook: / Visual: / etc.) — UNLESS [founders] explicitly ask for "the full brief" or "all the details."
- **Use markdown SPARINGLY.** A single **bold** phrase or one short list is fine. No multi-section structured docs in casual replies.
- **2-3 hooks max** when she asks for hook alternatives, not 5.
- **Match her energy.** If she throws a quick question, throw a quick answer back.
- **Don't restate her question or open with 'Great question' / 'Love this' as a verbal tic.**

**When to break the brevity rule:** ONLY if she literally says "give me the full brief," "spec it out," "deep strategy." Then you can structure with hooks/visual/audio/DNA/etc.
```

### B. Markdown renderer
Port `renderStudioMarkdown` + `renderStudioInline` verbatim (~70 lines). Handles `##`, `###`, `**bold**`, `*italic*`, `` `code` ``, `> blockquote`, `---`, `-` bullets. Wrap render call in try/catch.

### C. The voice mic block
Port the SpeechRecognition useEffect + toggleVoice function verbatim. Don't auto-send — let user review transcript first.

### D. ErrorBoundary
Port the class component verbatim. Wraps `<App/>`. Critical for demo stability.

### E. CSS `<details>` accordion pattern
```css
.howit-acc{...}
.howit-acc summary{list-style:none; cursor:pointer; ...}
.howit-acc summary::-webkit-details-marker{display:none}
.howit-acc[open] .howit-acc-chevron{transform:rotate(180deg)}
```

Used 5+ places in the engine. Consistent UX everywhere.

---

## 🔌 API endpoints to set up

### `/api/studio.js` (Gemini 2.5 Flash)
- Port verbatim from Lil Bucks but swap the LIL_BUCKS_SYSTEM constant with MAAZAH_SYSTEM (built from Maazah's CLAUDE.md)
- thinkingBudget:0 is non-negotiable
- Tolerate env var casing: `GEMINI_API_KEY || GEMINI_API_Key || GEMINI_KEY || GOOGLE_API_KEY`

### `/api/voice-compass.js` (Claude Sonnet 4.6)
- Port the prompt structure · adapt to Maazah's voice fingerprint (8 tonal territories, anti-patterns, customer-validated language)
- Returns JSON with: voice_score, verdict, tonal_territories, platform_fit, anti_pattern_flags, positive_signals, suggested_rewrites
- Uses `ANTHROPIC_API_KEY` env var

### `/api/panel.js` (Claude Sonnet 4.6)
- Port the structure · adapt the 4 personas to Maazah's customer base
- Returns JSON with: reactions[], headline_insight
- For Maazah's product (sauces/lentil dips), the 4 personas should be Maazah-customer archetypes — e.g., the family-kitchen mom, the dinner-party host, the curious foodie, the dietary-conscious shopper

### `/api/counter-strike.js` (Claude Sonnet 4.6)
- Port verbatim · adapt prompt to Maazah's brand thesis + competitors
- Returns JSON with 3 briefs

### `vercel.json`
Set maxDuration:60 for all 4 API functions.

---

## ✅ Verification checklist (walk in browser before declaring done)

- [ ] Page loads · Memo modal auto-opens
- [ ] Memo shows 3 sections (The Read · 5 Signals · 3 Moves) in Maazah's voice
- [ ] Closing Memo lands on Intelligence Brief (default section is 'intel')
- [ ] All 5 Intel subtabs render: Pulse / Trends / Comps / Counter-Strike / Ambassadors
- [ ] Each intel card has a glyph + accent rail + drop-button
- [ ] Competitor cards show chunky direction badges (heating up / cooling / flat)
- [ ] Counter-Strike Log collapses by default · clicks expand
- [ ] Content Briefs sort by Conviction Score · hover shows breakdown tooltip with the math
- [ ] Brief Detail modal: Intel → Alt hooks → Phone shot list → Captions → Production accordion → Amplify accordion → Footage Inspo → Crunch Bunch (lazy)
- [ ] Studio responds in 2-5s (Gemini Flash with thinkingBudget:0)
- [ ] Studio responses are CONVERSATIONAL — 60-120 words, no labeled-section walls
- [ ] Voice mic button works in Chrome/Edge · helper hint shows on Firefox
- [ ] Send-to-Studio buttons on intel cards open Studio with smart auto-fired seed
- [ ] Diagnostic Inbox: pick option → textarea appears (where applicable) → Lock it in → preserved note shows
- [ ] Free-form catch-all card works (submit → noted state with text preserved)
- [ ] Engine Thinking Flow pipeline animates · rail fills · active node pulses · Incoming-from pill shows
- [ ] Calendar + Performance show 🚧 Under construction banners with FPO content
- [ ] ErrorBoundary recovers gracefully (force an error to test — comment a closing tag temporarily)
- [ ] Footer shows correct model attribution

---

## 🧠 Memory: design rules from Lil Bucks experience (avoid these pitfalls)

These came up during Lil Bucks build. Apply to Maazah:

1. **Voice direction stays internal.** Don't write "lowercase warmth" or "ALL CAPS sparingly" in user-facing copy. Those rules live in CLAUDE.md / system prompts. The engine speaks IN the voice, not ABOUT it.

2. **Engine produces briefs, team produces + distributes.** Never use "approve" / "ship" / "post" language implying the engine publishes. Use "production-ready" / "delivered" / "in draft" / "team produces + distributes."

3. **No promo / sale / pricing questions.** Diagnostic Inbox shouldn't ask Maazah about flash sales or pricing — that's retailer/commercial territory, not content engine's lane.

4. **No founder-family assumptions.** Even though Yasameen + Sheilla are sisters and the brand is family-rooted, never draft briefs that REQUIRE family-member participation. Family = canonical origin reference, NEVER required participant.

5. **JSX text doesn't decode `\u` escapes.** Use real Unicode chars (— · → ✶) inline, NOT `—`-style escapes. Escape syntax only works inside JS string literals, not JSX text.

6. **Studio chat needs markdown rendering.** Without the renderer, Claude/Gemini's `##` `**` `>` `---` ship as raw syntax. Port the markdown renderer.

7. **Source recency rule.** Every signal-bearing card (Pulse, Trends, Comps, Welcome Highlights) needs sources ≤7 days old. Apply Lil Bucks's freshness chip pattern: "FRESH this week" (green) vs "STILL COMPOUNDING since {date}" (orange).

8. **First-time-reader copy.** Each tab title needs an italic Fraunces dek below it explaining what the surface is for. Emily/Yasameen+Sheilla shouldn't have to guess what each tab does.

9. **Tooltip on Conviction Score** — hover shows the 4-component math. Reveals the engine's thinking. Builds trust.

10. **Don't auto-fire expensive API calls.** Crunch Bunch Panel is gated behind a "Run pre-test" button. Voice Compass is gated behind the user pasting text + clicking score. Save cost + reduce failure surface.

---

## 📦 Suggested commit order

Don't try to port everything in one commit. Work in phases, commit after each:

1. `Foundation — design tokens + fonts + app shell + ErrorBoundary`
2. `Memo modal — auto-open + 3 sections`
3. `Intelligence Brief — subtabs + intel card pattern (glyphs + rails)`
4. `Content Briefs — Conviction Score system + cards + ride-now hero`
5. `Brief Detail Modal — sections + Phone Shot List + lazy panel`
6. `Studio — Gemini-powered chat + markdown renderer + voice mic`
7. `Diagnostic Inbox — 3 questions + free-form + submit flow`
8. `How It Works — Engine Thinking Flow pipeline + 4 accordions`
9. `Calendar + Performance previews — Under-construction state`
10. `Polish — footer + ticker colors + responsive + final sweep`

---

## 💬 Questions to ask Alex before starting

If anything's unclear, ask before guessing. Likely open questions:
- Does Maazah have brand-color hex values defined? If not, what's the palette direction?
- How many pillars does Maazah have? (Lil Bucks has 4 — Maazah might be different.)
- What are Maazah's hero DNA formats? (Lil Bucks has 7 — bowl-build, founder-emily, soil-story, crunch-asmr, shelf-spotted, fact-flip, meme-payload.)
- Is `GEMINI_API_KEY` env var in Maazah's Vercel project? If not, Alex will add it. (Code reads `GEMINI_API_Key` with weird casing as fallback.)
- What's the demo date? (Affects how aggressive to be with the conviction scores + recency claims.)
- Should the diagnostic posture lean MORE hypothesis-mode for Maazah given the pre-engagement framing?

---

## ⚡ Speed reference — what changed in Lil Bucks's final 24 hours

For context, the Lil Bucks engine went through these big upgrades on 2026-05-26:
- Studio switched Claude → Gemini 2.5 Flash (5-10× speed)
- Studio system prompt rewritten with brevity-as-default (60-120 word target)
- Conviction Score replaces priority chips on briefs
- Diagnostic Inbox redesigned with cream cards on cobalt + per-question color coding + submit flow + free-form catch-all
- Voice mic added to Studio
- ErrorBoundary added at root
- Crunch Bunch Panel lazy-loaded behind "Run pre-test" button
- Engine Thinking Flow gained pipeline animation + Incoming-from pill + Watches chips
- "OPERATE" language → "🚧 Under construction" everywhere
- Phone-mockup carousel reordered (Alt hooks lead, then phone shot list)
- 60+ commits total

Maazah inherits ALL of this. None of it is optional.

---

**Last note:** I built this engine over multiple sessions with Alex pushing hard on detail. The patterns here are battle-tested for a real founder demo. Don't reinvent — port. If something doesn't match the source, default to the source. Maazah's voice + content is the only thing that's Maazah's — everything else comes from Lil Bucks.

Good luck. Make it sing.

— Claude (Lil Bucks engine)
