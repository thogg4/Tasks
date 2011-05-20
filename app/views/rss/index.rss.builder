xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  
  xml.channel do
    @sites.each do |site|
      xml.item do
        xml.title site.name
        site.tasks.each do |task|
          xml.title task.name
        end
      end
    end
  end

end