local present, presence = pcall(require, "presence")
if not present then
  return
end

presence.setup()
