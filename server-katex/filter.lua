function Pandoc(doc)
    local tmp_name = os.tmpname()
    local math = assert(io.popen("deno run server-katex/math.ts > " .. tmp_name, "w"))
    doc:walk({
        Math = function(el)
			if el.mathtype == 'DisplayMath' then
				assert(math:write("d" .. el.text:gsub("\n", " ") .. "\n"))
			else
				assert(math:write("i" .. el.text:gsub("\n", " ") .. "\n"))
			end
        end
    })
    math:close()
    local tmp = assert(io.open(tmp_name, "r"))
    doc = doc:walk({
        Math = function(el)
			return pandoc.RawInline(FORMAT, tmp:read())
        end
	})
    tmp:close()
    os.remove(tmp_name)
    return doc
end
