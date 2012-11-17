xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
  xml.title "Project 4"
  xml.description "A project management website"
  xml.link root_url

  for project in @projects
    xml.item do
      xml.title project.name
      xml.description project.description
      xml.created_at project.created_at.to_s(:rfc822)
      xml.pubDate project.updated_at.to_s(:rfc822)
      xml.link project_url(project)
      xml.guid project_url(project)

      for task in project.tasks
        xml.task do
          xml.title task.title
          xml.status task.status
          xml.priority task.priority
          xml.percentage_completed task.percentage_completed
          xml.due_date task.due_date.to_s(:rfc822)
          xml.estimated_date task.estimated_date.to_s(:rfc822)
          xml.created_at task.created_at.to_s(:rfc822)
          xml.pubDate task.updated_at.to_s(:rfc822)
          xml << render(partial: 'users', locals: {builder: xml, users: task.users })
          xml.link project_task_url(project, task)
        end
      end

      for bug in project.bugs
        xml.bug do
          xml.title bug.title
          xml.status bug.status
          xml.priority bug.status
          xml.percentage_completed bug.percentage_completed
          xml.due_date bug.due_date.to_s(:rfc822)
          xml.estimated_date bug.estimated_date.to_s(:rfc822)
          xml.created_at bug.created_at.to_s(:rfc822)
          xml.pubDate bug.updated_at.to_s(:rfc822)
          xml << render(partial: 'users', locals: { builder: xml, users: bug.users })
          xml.link project_bug_url(project, bug)
        end
      end

      for resource in project.resources
        xml.resource do
          xml.title resource.title
          xml.description resource.content
          xml.permissions resource.permissions
          xml.created_at resource.created_at.to_s(:rfc822)
          xml.pubDate resource.updated_at.to_s(:rfc822)
          xml.link project_resource_url(project, resource)
        end
      end
    end
  end
end
end


