import { readLines } from "https://deno.land/std@0.134.0/io/mod.ts";
import katex from "https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.mjs";

const macros = [];
for await (const line of readLines(Deno.stdin)) {
  try {
    const output = katex.renderToString(line.slice(1), {
      displayMode: line[0] == 'd',
      throwOnError: false,
	  macros: macros,
	  strict: false,
	  fleqn: false
    }).replace(/(\r\n|\n|\r)/gm, "");
	console.log(output);
  } catch (error) {
    throw new Error(`Input: ${line}\n\nError: ${error}`);
  }
}
