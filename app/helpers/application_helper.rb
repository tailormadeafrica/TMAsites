module ApplicationHelper

  def check_location(location)
    childs = Refinery::Locations::Location.where(:parent_id => location)
    if childs.present?
      true
    end
  end

  def breadcrumbs(page=nil,location=nil,post=nil,accommodation=nil)
    links = []
    links << link_to('Home', '/')


    if page.present?
      if page.link_url.present? and (['/locations'].include? page.link_url or ['/accommodations'].include? page.link_url)
        # links << page.title
      else
        links << link_to(page.title, refinery.url_for(page))
      end

    end
    if location.present?
      if location.parent.present?
        if location.parent.parent.present?
          links << link_to(strip_tags(location.parent.parent.name), "/#{location.parent.parent.slug}")
          links << link_to(strip_tags(location.parent.name), "/#{location.parent.parent.slug}/#{location.parent.slug}")
        else
          links << link_to(strip_tags(location.parent.name), "/#{location.parent.slug}")
        end


      end
      if location.parent.present? and location.parent.parent.present?
        links << link_to(strip_tags(location.name), "/#{location.parent.parent.slug}/#{location.parent.slug}/#{location.slug}")
      elsif location.parent.present?
        links << link_to(strip_tags(location.name), "/#{location.parent.slug}/#{location.slug}")
      else
        links << link_to(strip_tags(location.name), "/#{location.slug}")
      end
    end

    if post.present?
      links << link_to(post.title, refinery.blog_post_url(post))
    end

    if accommodation.present?

      if accommodation.locations.first.parent.present?
        if accommodation.locations.first.parent.parent.present?
          links << link_to(strip_tags(accommodation.locations.first.parent.parent.name), "/#{accommodation.locations.first.parent.parent.slug}")
          links << link_to(strip_tags(accommodation.locations.first.parent.name), "/#{location.parent.parent.slug}/#{accommodation.locations.first.parent.slug}")
        else
          links << link_to(strip_tags(accommodation.locations.first.parent.name), "/#{accommodation.locations.first.parent.slug}")
        end
      end

      if accommodation.locations.first.present?
        if accommodation.locations.first.parent.present? and accommodation.locations.first.parent.parent.present?
          links << link_to(strip_tags(accommodation.locations.first.name), "/#{accommodation.locations.first.parent.parent.slug}/#{accommodation.locations.first.parent.slug}/#{accommodation.locations.first.slug}")
        elsif accommodation.locations.first.parent.present?
          links << link_to(strip_tags(accommodation.locations.first.name), "/#{accommodation.locations.first.parent.slug}/#{accommodation.locations.first.slug}")
        else
          links << link_to(strip_tags(accommodation.locations.first.name), "/#{accommodation.locations.first.slug}")
        end
      end

      links << link_to(strip_tags(accommodation.name), refinery.accommodations_accommodation_path(accommodation))
    end
    raw links.join('&nbsp;&nbsp;>&nbsp;&nbsp;')
  end


  def location_link(child)
    if child.parent.present? and child.parent.parent.present?
      "/#{child.parent.parent.slug}/#{child.parent.slug}/#{child.slug}"
    elsif child.parent.present?
      "/#{child.parent.slug}/#{child.slug}"
    else
      "/#{child.slug}"
    end
  end
end
