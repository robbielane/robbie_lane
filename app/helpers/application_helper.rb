module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => false, :hard_wrap => true)

    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :lax_html_blocks => true,
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
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
