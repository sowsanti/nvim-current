local comment_status, comment = pcall(require, "Comment")
if not comment_status then
  print("Comment plugin not found")
  return
end

comment.setup()
