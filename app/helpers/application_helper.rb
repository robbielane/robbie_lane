module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true)
    return markdown.render(text).html_safe
  end

  def svg_tag filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def format_post_body(text)
    if text.length > 240
      text[0..239] + "..."
    else
      text
    end
  end

  def format_date(date_time)
    date_time.strftime('%B %d, %Y')
  end

  def change_status(post)
    if post.status == 'pending'
      post_path(slug: post.slug, post: {status: 'published'})
    else
      post_path(slug: post.slug, post: {status: 'pending'})
    end
  end
end
