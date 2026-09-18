#!/usr/bin/env ruby

# Add the last modified date to posts based on Git history.
Jekyll::Hooks.register :posts, :post_init do |post|
  commit_num = %x(git rev-list --count HEAD "#{post.path}")

  if commit_num.to_i > 1
    lastmod_date = %x(git log -1 --pretty="%ad" --date=iso "#{post.path}")
    post.data["last_modified_at"] = lastmod_date
  end
end
