-- detect ansible files

local function looks_like_ansible_by_content(filepath)
  local ok, f = pcall(io.open, filepath, "r")
  if not ok or not f then
    return false
  end
  local i = 0
  for line in f:lines() do
    local l = line:lower()
    if l:match("^%s*tasks%s*:") or l:match("^%s*roles%s*:") or l:match("^%s*handlers%s*:") then
      f:close()
      return true
    end
    i = i + 1
    if i >= 50 then
      break
    end
  end
  f:close()
  return false
end

vim.filetype.add({
  extension = {
    yml = 'yaml',
    yaml = 'yaml',
  },
  -- pattern matches against the full path. Common Ansible dirs/files.
  pattern = {
    [".*/roles/.*%.ya?ml$"] = 'yaml.ansible',
    [".*/tasks/.*%.ya?ml$"] = 'yaml.ansible',
    [".*/handlers/.*%.ya?ml$"] = 'yaml.ansible',
    [".*/playbooks/.*%.ya?ml$"] = 'yaml.ansible',
    [".*playbook.*%.ya?ml$"] = 'yaml.ansible',
    [".*site%.ya?ml$"] = 'yaml.ansible',
  },
})

-- Fallback content-based detection for files that aren't in an obvious path
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.yml", "*.yaml"},
  callback = function(args)
    local fname = args.file
    if not fname then
      return
    end
    -- Only set to ansible if content looks like an Ansible playbook/role
    if looks_like_ansible_by_content(fname) then
      vim.bo.filetype = 'yaml.ansible'
    end
  end,
})

