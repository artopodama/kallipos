function Image(img)
  if img.classes:find('notes',1) then
    local f = io.open("mynotes/" .. img.src, 'r')
    local doc = pandoc.read(f:read('*a'))
    f:close()
    local caption = pandoc.utils.stringify(doc.meta.caption) or "var has not been set"
    local var = "" .. caption 
    return pandoc.RawInline('markdown',var)
  end
end