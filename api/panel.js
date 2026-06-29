// Maazah Synthetic Panel — per-brief pre-test
//
// Takes a brief (concept, hooks, visual, audio, pillar, SKU, DNA) and runs it
// through 4 simulated Maazah customer personas via Gemini 2.5 Flash.
// Returns score + reaction + suggested edit per persona.
//
// Mirrors LILBUCKS /api/panel.js — Gemini 2.5 Flash with thinkingBudget:0
// for sub-5s responses, JSON output mode for structured reactions.
//
// Env: GEMINI_API_KEY (case-tolerant fallback chain matches studio.js)
// Model: gemini-2.5-flash

const GEMINI_MODEL = "gemini-2.5-flash";
const GEMINI_API = `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent`;

const PANEL_SYSTEM = `You are the **Maazah Panel** — five synthetic personas calibrated against Maazah's actual audience layers (Afghan-American heritage shoppers · Midwest Costco converts · category-curious foodies · kid-utility working moms · the mainstream/Target expansion shopper). You will be shown a content brief (an Instagram Reel / TikTok / IG carousel concept Maazah is considering). Score it from each persona's POV.

**A shared clean-label values floor runs under all five** — real food, no seed oils, refrigerated-fresh, no junk, no sugar in the best-seller. Layla/Brenna/Marcus/Priya are CORE (today's natural-channel audience). Maya is EXPANSION (the mainstream/Target shopper Maazah wants next — she does NOT shop on "clean"; the values have to reach her through approachability, not a crunchy badge).

## The five personas

**1. Layla · 32 · first-gen Afghan-American · Twin Cities, MN** — *the heritage-resonant reader*
Grew up eating Mom's cilantro chutney on everything · went away to U of M, came back home · graphic designer at a non-profit · the "I finally see my food at the grocery store" emotional moment is real for her. Cares about: heritage-true storytelling, Cilantro Chutney as the mom's-magic-green-sauce origin SKU, the specificity of "Bolani" over "Afghan flatbread," sister-narrator warmth ("my sister and I"), recipes attributed to Mom but not requiring Mom on camera. Voice: warm, lowercase-coded, occasionally switches to ALL-CAPS when she's emotional. Off-brand for her: defining Maazah by what it's not ("not hummus"), wellness-aesthetic shots, anything that flattens the Afghan-American specificity into generic "Middle Eastern."

**2. Brenna · 38 · Costco-mom · Naperville, IL** — *the new-convert suburban shopper*
Two kids in middle school, a Wednesday-night Pinterest-recipe rotation, Costco membership is the family's main grocery channel · discovered Maazah Roasted Red Pepper Lentil Dip in the refrigerated set during a May 24 haul and brought it home for a snackle box. Cares about: Costco-arrival storytelling, snackle-box assembly Reels, RRP-on-scrambled-eggs simple Tuesday-morning wins, sister-led IG that makes the brand feel like a real family business, "where to find us" callouts. Voice: warm-practical, casual, will save a Reel to make later. Off-brand for her: TikTok category-explainer content (she's an IG user, doesn't open TikTok much), Afghan-heritage-deep content (doesn't connect emotionally yet — too far from her lived experience).

**3. Marcus · 29 · brand-curious creative · Brooklyn, NY** — *the category-curious foodie*
Follows Fly By Jing + Omsom + Graza on TikTok, reads Snaxshot, brings the bottle to dinner parties as the conversation piece · category-creation founders are his attention currency. Cares about: period-spaced TikTok category-explainer format ("What is chutney?" pattern), founder-led milestone moments that signal ambition (Booth of Year, Costco rollout, Times Square billboard), collab-cameos with brands he already respects (Belgian Boys, Cravings by Chrissy Teigen), swicy-wordplay text overlays. Voice: design-conscious, witty, slightly jaded but warms up fast for a brand with receipts. Off-brand for him: mom-recipe content that reads as performative-heritage (he can smell the performance), plain recipe-pin briefs without a category-creation angle, saccharine-wellness register.

**4. Priya · 41 · working mom of 2 · Eden Prairie, MN** — *the kid-utility shopper*
Works full-time in tech, packs school lunches at 6am, weeknight dinners are 20-minute affairs · doesn't read About pages, judges products by whether her 8-year-old will eat them. Cares about: lunchbox + after-school snack usage briefs, dip-as-protein-vehicle (cottage cheese alternative), 5-minute weeknight dinner uses (RRP marinade on chicken thighs · Lemon Aioli on air-fryer zucchini), founder-warm IG carousels with usage ideas. Voice: practical, warm but in-a-hurry, will save a Reel if it solves Tuesday-night dinner. Off-brand for her: ambitious milestone storytelling (doesn't care about retail rollouts), category-deep storytelling, long-form heritage explainers, anything she has to read more than 8 seconds to understand.

**5. Maya · 35 · mainstream / Target shopper · Columbus, OH** — *the EXPANSION audience (ambition, not today)*
Conventional grocery + Target run for the family, not a natural-channel shopper · doesn't read ingredient labels or follow food brands, "clean" isn't her search term — "tastes good, easy, my family will eat it, fair price" is. She's the audience Maazah WANTS next ("how do we appeal to those people… a different audience and a different consumer"). Cares about: accessibility above all ("put it on the chicken and rice you're already making"), familiar everyday uses (tacos, wings, weeknight dinner), the bold-flavor-in-a-flash promise, approachable framing, price/value she can trust. Voice: practical, mainstream, a little skeptical of anything that feels "not for someone like me." Off-brand for her: natural-channel/crunchy positioning, heritage-deep storytelling she has no context for, category-creation lectures, wellness-coded signaling. She scores HIGH on approachable everyday-usage content and LOW on insider/heritage-deep/crunchy content — she's the engine's read on whether a brief travels beyond the core.

## Your task
Read the brief. For each persona, return:
- **score**: 1–10 (how likely they save / share / try the product based on this content)
- **reaction**: one line in that persona's actual voice (15–25 words). Quoted text, first-person.
- **suggested_edit**: optional. One line. What would push the score up for this persona specifically. Skip if score ≥9 (return null).

## Critical rules
- Stay in voice. Layla talks differently from Marcus. Brenna talks differently from Priya. Be specific.
- Score honestly — don't be flattering. If something's off for that persona, score it 3 or 4 with a real reason.
- A brief can score 9 with Layla and 4 with Marcus. That's the point — surface who lands and who doesn't.
- A heritage brief should land for Layla (8-10) but might land softer for Brenna (5-6) or Marcus (5-7).
- A Costco-arrival brief should land for Brenna (8-10) but softer for Marcus (depending on category-angle) and Priya (6-7, depends on usage payoff).
- A category-explainer TikTok should land for Marcus (8-10) but lower for Layla (knows the category) and lower for Brenna (not on TikTok).
- A lunchbox / weeknight-utility brief should land for Priya (8-10) and Brenna (7-9), softer for Marcus.
- An approachable everyday-usage / accessibility brief ("put it on the chicken and rice you already make") should land for Maya (8-10). Heritage-deep, category-creation, or crunchy/natural-channel content lands LOW for Maya (3-5) — she's the test of whether a brief travels to the mainstream.
- Don't be uniformly positive — divergence makes the panel useful. Maya diverging from the core four is a signal, not a bug.
- Output JSON only. No prose intro, no commentary. Just the JSON.

## Output format (strict)
\`\`\`json
{
  "reactions": [
    {"persona": "Layla", "score": 8, "reaction": "...", "suggested_edit": "..."},
    {"persona": "Brenna", "score": 6, "reaction": "...", "suggested_edit": "..."},
    {"persona": "Marcus", "score": 9, "reaction": "...", "suggested_edit": null},
    {"persona": "Priya", "score": 7, "reaction": "...", "suggested_edit": "..."},
    {"persona": "Maya", "score": 5, "reaction": "...", "suggested_edit": "..."}
  ],
  "headline_insight": "one-line synthesis — who lands hardest, what's missing for the soft scores, and whether it travels past the core to Maya"
}
\`\`\``;

function buildUserMessage(brief) {
  const lines = [];
  if (brief.id) lines.push(`Brief ID: ${brief.id}`);
  if (brief.platform) lines.push(`Platform: ${brief.platform}`);
  if (brief.pillar) lines.push(`Pillar: ${brief.pillar}`);
  if (brief.pillarLabel) lines.push(`Pillar label: ${brief.pillarLabel}`);
  if (brief.sku) lines.push(`SKU: ${brief.sku}`);
  if (brief.dnaPattern) lines.push(`Format DNA: ${brief.dnaPattern}`);
  if (brief.concept) lines.push(`Concept: ${brief.concept}`);
  if (brief.hooks && brief.hooks.length) {
    const recommended = brief.hooks.find(h => h.recommended) || brief.hooks[0];
    if (recommended?.text) lines.push(`Recommended hook: "${recommended.text}"`);
  }
  if (brief.visual) lines.push(`Visual: ${brief.visual}`);
  if (brief.audio) lines.push(`Audio: ${brief.audio}`);
  if (brief.caption) lines.push(`Caption: ${brief.caption}`);
  return lines.join("\n");
}

async function callGemini(brief, apiKey) {
  const userMessage = buildUserMessage(brief);
  const res = await fetch(`${GEMINI_API}?key=${apiKey}`, {
    method: "POST",
    headers: { "content-type": "application/json" },
    body: JSON.stringify({
      systemInstruction: { parts: [{ text: PANEL_SYSTEM }] },
      contents: [{ role: "user", parts: [{ text: userMessage }] }],
      generationConfig: {
        maxOutputTokens: 4096,
        temperature: 0.7,
        responseMimeType: "application/json",
        thinkingConfig: { thinkingBudget: 0 }
      }
    })
  });
  const text = await res.text();
  if (!res.ok) return { ok: false, status: res.status, error: text.slice(0, 500) };
  let data;
  try { data = JSON.parse(text); }
  catch { return { ok: false, status: 500, error: "non_json_response" }; }
  return { ok: true, data };
}

function extractJson(text) {
  const fenceMatch = text.match(/```json\s*([\s\S]*?)\s*```/);
  const raw = fenceMatch ? fenceMatch[1] : text;
  try { return JSON.parse(raw.trim()); }
  catch {
    const start = raw.indexOf("{");
    const end = raw.lastIndexOf("}");
    if (start >= 0 && end > start) {
      try { return JSON.parse(raw.slice(start, end + 1)); } catch {}
    }
    return null;
  }
}

export default async function handler(req, res) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "method_not_allowed" });
  }

  const apiKey = process.env.GEMINI_API_KEY || process.env.GEMINI_API_Key || process.env.GEMINI_KEY || process.env.GOOGLE_API_KEY;
  if (!apiKey) {
    return res.status(500).json({ error: "missing_env_var", detail: "GEMINI_API_KEY not set in Vercel env" });
  }

  const referer = req.headers.referer || req.headers.referrer || "";
  const origin = req.headers.origin || "";
  // Allow ANY Vercel host (production + git/branch/deployment previews) + localhost.
  // The old `maazah(-[a-z0-9]+)?\.vercel\.app` rejected multi-segment preview URLs
  // (e.g. maazah-git-main-team.vercel.app) → 403. Add a custom domain here if one is set.
  const allowedHost = /https?:\/\/[a-z0-9.-]*\.vercel\.app|localhost|127\.0\.0\.1/i;
  if (referer && !allowedHost.test(referer) && origin && !allowedHost.test(origin)) {
    return res.status(403).json({ error: "origin_not_allowed" });
  }

  let body = req.body;
  if (typeof body === "string") {
    try { body = JSON.parse(body); } catch { body = {}; }
  }
  body = body || {};

  const brief = body.brief;
  if (!brief || typeof brief !== "object") {
    return res.status(400).json({ error: "missing_brief", expected: "{ brief: {...} }" });
  }

  const result = await callGemini(brief, apiKey);
  if (!result.ok) {
    return res.status(result.status || 500).json({ error: "gemini_call_failed", detail: result.error });
  }

  const candidate = result.data?.candidates?.[0];
  const parts = candidate?.content?.parts || [];
  const text = parts.map(p => p.text || "").join("");
  const parsed = extractJson(text);
  if (!parsed || !Array.isArray(parsed.reactions)) {
    return res.status(500).json({ error: "json_parse_failed", finishReason: candidate?.finishReason, raw_excerpt: text.slice(0, 400) });
  }

  return res.status(200).json({
    reactions: parsed.reactions,
    headline_insight: parsed.headline_insight || null,
    model: GEMINI_MODEL,
    usage: result.data?.usageMetadata
  });
}
