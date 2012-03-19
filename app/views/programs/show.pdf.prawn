#  Report Generator
#prawn_document do |pdf|

  logopath = "#{Rails.root}/public/images/emap_logo.jpg"
  sigpath = "#{Rails.root}/public/images/NI_sig.png"
  require 'sanitize'

  #   Font Specs
  pdf.font "Helvetica"
  pdf.font_size 11

  #   Cover Page
  pdf.bounding_box([pdf.bounds.left + 52,pdf.bounds.top - 30], :width => 378, :height => 136) do
  pdf.image logopath, :width => 378, :height => 136
  end

  pdf.move_down(70)
  pdf.text "#{@program.name}", :size => 32, :style => :bold, :spacing => 10, :align => :center
  pdf.move_down(100)

  #   Executive Summary
  pdf.start_new_page
  pdf.move_down(12)
  pdf.text "I.  Executive Summary", :size => 16, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "EMAP truly appreciated the opportunity to partner with the #{@program.name} staff in successfully accomplishing the initial Event Strategic Review (ESR). EMAP, partnering with stakeholders from the Federal Emergency Management Agency (FEMA), National Emergency Management Agency (NEMA), and International Association of Emergency Managers (IAEM) has developed the Event Strategic Review (ESR). The goal of the pilot project is to utilize EMAP’s independent peer-review process to collect and analyze data that will support and assist the FEMA National Preparedness Assessment Division (NPAD) in meeting goals established in the Post Katrina Emergency Management Reform Act of 2006 and Remedial Action Management Program. Additionally, the pilot provided EMAP Training & Technology an opportunity to alpha test the ESR Application (ESRA) currently in development. For the purposes of the initial pilot, ESRA was alpha tested as an Access Database to provide a template by which the pilot software platform could be initiated."
  pdf.move_down(12)
  pdf.text "EMAP will review and translate data collected into an aggregate format that will be provided to partnering stakeholders referenced above. ESR pilot expenses are funded through EMAP’s cooperative agreement with FEMA thus providing your Program with a “free” review."
  pdf.move_down(12)
  pdf.text "Please find attached a summary report that outlines preliminary findings of the review team. Thank you for devoting programmatic time, as well as the time of your staff towards the ESR pilot. We would like to take this opportunity to recognize the exemplary professionalism and assistance provided by the staff of the #{@program.name} and their Emergency Management Agency."
  pdf.move_down(12)
  pdf.text "Emergency management requires the cooperation and collaboration of all organizations having a role in response and recovery. Your cooperation and efforts demonstrate the level of leadership and commitment required for the continual professionalization of emergency management to ensure our collective ability to protect the citizens we serve."
  pdf.move_down(42)
  pdf.text "Sincerely,"
  pdf.move_down(24)
  pdf.bounding_box([pdf.bounds.left + 20,pdf.bounds.top - 455], :width => 256, :height => 64) do
  pdf.image sigpath, :width => 256, :height => 64
  end
  pdf.move_down(17)
  pdf.text "Nicole M. Ishmael
  EMAP Executive Director", :size => 12, :spacing => 4


  #   Candidate Information
  pdf.start_new_page
  pdf.move_down(12)
  pdf.text "II. Introduction", :size => 16, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "A.  ESR Candidate", :size => 14, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "Program: #{@program.name}", :size => 12, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text " Program Address:", :size => 12, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "#{@program.program_jurisdiction}", :indent_paragraphs => 40
  pdf.text "#{@program.program_street}", :indent_paragraphs => 40
  pdf.text "#{@program.program_city}, #{@program.program_state}", :indent_paragraphs => 40
  pdf.text "#{@program.program_zip}", :indent_paragraphs => 40

  pdf.move_down(12)
  pdf.text " ESR Contact:", :size => 12, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "#{@program.program_contact}", :indent_paragraphs => 40
  pdf.text "#{@program.contact_title}", :indent_paragraphs => 40
  pdf.text "#{@program.contact_phone}", :indent_paragraphs => 40
  pdf.text "#{@program.contact_mobile}", :indent_paragraphs => 40
  pdf.text "#{@program.contact_email}", :indent_paragraphs => 40
  pdf.move_down(12)
  pdf.text "B.  ESR Team", :size => 14, :style => :bold, :spacing => 4
  pdf.move_down(12)
  @program.reviews.each do |revs|
    revs.review_assignments.each do |assign|
      pdf.text "#{assign.user.name}, #{assign.user.agency} - #{assign.user.job_title}", :indent_paragraphs => 40
    end
  end
  pdf.move_down(12)
  pdf.text "C.  ESR Methodology", :size => 14, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "As this was a “stand-alone” pilot, an EMAP Reviewer team was assembled to conduct an On-site review seperate from an existing scheduled baseline assessment. The process followed many of the same components of the proven peer-review process used by EMAP. The Program was given an opportunity to complete a Self-review, submit supportive documentation and complete an On-site Review prior to the arrival of the Assessor Team."
  pdf.move_down(12)
  pdf.text "The program completed an internal self review against pilot methodology and EMAP Standards. The On-site Review was conducted by a team of EMAP liaisons, which provided pilot guidance and direct observation for measuring ESR pilot delivery; monitored progress and outcomes; and coordinated the activities of three (3) independent trained reviewers from outside the pilot program."


  #   Purpose, Scope & Organization
  pdf.start_new_page
  pdf.text "III.  Applying the ESR Data Points", :size => 16, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "A.  Purpose and Scope of the ESR Data Points", :size => 14, :style => :bold, :spacing => 4
  pdf.move_down(12)
  pdf.text "The pilot project purpose is to collect and identify priority issues, corrective actions, lessons learned and best practices for improvement of existing after-action processes used for exercises and real world events."
  pdf.move_down(12)
  pdf.text "The ESR is not prescriptive in nature, rather the ESR applies existing standards and data analysis inquiry to review event documentation pursuant to EMAP Standards 4.3: Hazard Identification, Risk Assessment and Consequence Analysis and EMAP Standard 4.14: Exercises, Evaluations and Corrective Actions. An “Event” is defined as an occurrence of significant involvement that includes multiple jurisdictions and/or agencies that spans multiple operational periods that produces both information and formal event documentation."
  pdf.move_down(12)
  pdf.text "Documents to be reviewed and/or considered:"
  pdf.move_down(12)
  pdf.text "• Exercise Events (Discussion Based, Tabletops, Functional & Full-Scale)", :indent_paragraphs => 30
  pdf.move_down(3)
  pdf.span(360, :position => :center) do
    pdf.text "o State Preparedness Report(s)"
    pdf.text "o After Action Report(s)"
    pdf.text "o Improvement Plan(s)"
    pdf.text "o Corrective Action Plan(s)"
    pdf.text "o Training & Exercise Work Plan(s)"
  end
  pdf.move_down(12)
  pdf.text "• Real World Events", :indent_paragraphs => 30
  pdf.move_down(3)
  pdf.span(360, :position => :center) do
    pdf.text "o Incident Action Plan(s)"
    pdf.text "o After Action Report(s)"
    pdf.text "o Improvement Plan(s)"
    pdf.text "o Corrective Action Plan(s)"
  end
  pdf.move_down(10)
  pdf.text "Criteria that will be collected and analyzed will span from 2006 to present:"
  pdf.move_down(3)
  pdf.span(450, :position => :center) do
    pdf.text "• Event details (date, location, type of event/exercise, etc.)"
    pdf.text "• Top 10 Corrective Action items currently being improved upon"
    pdf.text "• Corrective Actions that have been resolved within the last year"
    pdf.text "• Lessons Learned within the last year"
    pdf.text "• Agency funding for Exercise(s)"
    pdf.text "• Identified strengths and areas of improvement"
    pdf.text "• EMAP Standard 4.3: Hazard Identification, Risk Assessment and Consequence Analysis"
    pdf.text "• EMAP Standard 4.14: Exercises, Evaluations and Corrective Actions"
  end
  pdf.move_down(20)
  pdf.text "B.  Organization of Review Findings", :size => 14, :style => :bold, :spacing => 4
  pdf.move_down(10)
  pdf.text "Section IV of the review report lists foundational documentation that provided for review and data points.  Review and data points were applied to the Program, and describe the findings of the review team for each point.  Any exemplary or otherwise noteworthy aspects of the Program that were brought to light during the review are included."


  #   Program Funding Data
  #pdf.start_new_page
  #pdf.move_down(12)
  #pdf.text "Exercise Funding Data", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 30
  #pdf.move_down(18)
  #pdf.text "Local Funding Provided for Exercises Annually:", :size => 12, :spacing => 16, :indent_paragraphs => 37
  #pdf.move_down(12)
  #pdf.text "2007: #{@program.funding7}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "2008: #{@program.funding8}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "2009: #{@program.funding9}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "2010: #{@program.funding10}", :spacing => 16, :indent_paragraphs => 44
  #pdf.move_down(12)
  #pdf.text "Federal Funding Provided for Exercises Annually:", :spacing => 16, :size => 12, :indent_paragraphs => 37
  #pdf.move_down(12)
  #pdf.text "2007: #{@program.gfunding7}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "Source of funds:", :spacing => 16, :indent_paragraphs => 44
  #@program.funding07_sources.each do |federal7|
  #  pdf.text "• #{federal7.source}", :spacing => 16, :indent_paragraphs => 51
  #end
  #pdf.move_down(8)
  #pdf.text "2008: #{@program.gfunding8}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "Source of funds:", :spacing => 16, :indent_paragraphs => 44
  #@program.funding08_sources.each do |federal8|
  #  pdf.text "• #{federal8.source}", :spacing => 16, :indent_paragraphs => 51
  #end
  #pdf.move_down(8)
  #pdf.text "2009: #{@program.gfunding9}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "Source of funds:", :spacing => 16, :indent_paragraphs => 44
  #@program.funding09_sources.each do |federal9|
  #  pdf.text "• #{federal9.source}", :spacing => 16, :indent_paragraphs => 51
  #end
  #pdf.move_down(8)
  #pdf.text "2010: #{@program.gfunding10}", :spacing => 16, :indent_paragraphs => 44
  #pdf.text "Source of funds:", :spacing => 16, :indent_paragraphs => 44
  #@program.funding10_sources.each do |federal10|
  #  pdf.text "• #{federal10.source}", :spacing => 16, :indent_paragraphs => 51
  #end

  #   Corrective Action Process
  pdf.start_new_page
  pdf.text "Corrective Action Process", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 30
  pdf.move_down(12)
  pdf.text "The Program has a Continuous Corrective Action process: #{@program.continuous_ca_plan}", :spacing => 16, :size => 12, :indent_paragraphs => 37
  pdf.text "The Program has a Corrective Action Development Process: #{@program.proc_for_devel}", :spacing => 16, :size => 12, :indent_paragraphs => 37
  pdf.text "The Program has a Corrective Action Tracking Process: #{@program.ca_tracked}", :spacing => 16, :size => 12, :indent_paragraphs => 37
  pdf.move_down(8)
  pdf.text "Corrective Action Process Summary:", :spacing => 16, :size => 12, :indent_paragraphs => 37
  caps = Sanitize.clean(@program.ca_summary)
  pdf.span(350, :position => :center) do
    pdf.text caps, :spacing => 16, :size => 12, :indent_paragraphs => 20
    #pdf.text "#{@program.ca_summary}", :spacing => 16, :size => 12, :indent_paragraphs => 20
  end
  #pdf.move_down(12)
  pdf.text "Resolved Corrective Actions in the previous year:", :spacing => 16, :size => 12, :indent_paragraphs => 37
  capr = Sanitize.clean(@program.ca_resolved)
  pdf. span(350, :position => :center) do
    pdf.text capr
  end


  #   Disaster Declarations
  pdf.move_down(12)
  @program.disdecs.each do |disaster|
    pdf.text "Disaster Declarations", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.span(350, :position => :center) do
      disaster.disaster_declarations.each do |declar|
        pdf.text "• #{declar.name} - #{declar.ddate}"
      end
    end
  end


  #   Exercise Plans
  pdf.move_down(12)
  pdf.text "Exercise Plan(s)", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 30
  @program.training_plans.each do |tplans|
    pdf.move_down(10)
    pdf.text "#{tplans.name}", :spacing => 16, :size => 12, :indent_paragraphs => 44
    pdf.move_down(8)
    pdf.text "Exercises:", :spacing => 16, :size => 12, :indent_paragraphs => 51
    pdf.move_down(3)
    tplans.texercises.each do |texes|
      pdf.text "• #{texes.name} - #{texes.tdate}", :spacing => 16, :size => 12, :indent_paragraphs => 58
    end
    pdf.move_down(8)
    pdf.text "Exercise Priorities:", :spacing => 16, :size => 12, :indent_paragraphs => 51
    pdf.move_down(3)
    tplans.tpriorities.each do |priority|
      pdf.text "• #{priority.name}", :spacing => 16, :size => 12, :indent_paragraphs => 58
    end
    pdf.move_down(8)
    pdf.text "Exercise Target Capabilities:", :spacing => 16, :size => 12, :indent_paragraphs => 51
    pdf.move_down(3)
    tplans.train_tcaps.each do |cap|
      pdf.text "• #{cap.tcap}", :spacing => 16, :size => 12, :indent_paragraphs => 58
    end
  end


  #   EMAP 4.3
  pdf.start_new_page
  pdf.span(437, :position => :right) do
    pdf.text "Hazard Identification, Risk Assessment and Consequence Analysis", :spacing => 16, :size => 14, :style => :bold
  end
  pdf.move_down(10)
  @program.hiras.each do |haz|
    pdf.text "The Program's Exercise Plan matches their HIRA: #{haz.matching}", :spacing => 16, :size => 12, :indent_paragraphs => 44
    pdf.move_down(8)
    pdf.text "Identified Hazards:", :spacing => 16, :size => 12, :indent_paragraphs => 44
    pdf.move_down(3)
    haz.hazards.each do |list|
      pdf.text "• #{list.name}", :spacing => 16, :size => 12, :indent_paragraphs => 50
    end
  end


  #   Events
  pdf.move_down(24)
  pdf.text "IV. Event Review Findings", :size => 16, :style => :bold, :spacing => 5
  @program.events.each do |item|
    pdf.move_down(10)
    pdf.text "Event: #{item.event_name}", :size => 13, :style => :bold, :spacing => 5, :indent_paragraphs => 20
    pdf.move_down(8)
    pdf.text "Event Start Date: #{item.event_date.strftime("%b %d %y")}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event End Date: #{item.event_end_date.strftime("%b %d %y")}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event Duration: #{item.event_duration}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event State: #{item.event_state}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event Location(s)/Site(s):", :indent_paragraphs => 30
    pdf.move_down(3)
    item.elocations.each do |location|
      pdf.text "• #{location.name}", :indent_paragraphs => 42
    end
    pdf.move_down(8)
    pdf.text "Event Type: #{item.event_type}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event Host(s):", :indent_paragraphs => 30
    pdf.move_down(3)
    item.ehosts.each do |hist|
      pdf.text "• #{hist.host}", :indent_paragraphs => 42
    end
    pdf.move_down(8)
    pdf.text "Event Funding Source(s):", :indent_paragraphs => 30
    pdf.move_down(3)
    item.efundings.each do |fend|
      pdf.text "• #{fend.name}", :indent_paragraphs => 42
    end
    pdf.move_down(8)
    pdf.text "Event Goals:", :indent_paragraphs => 30
    pdf.move_down(3)
    item.egoals.each do |goal|
      pdf.text "• #{goal.name}", :indent_paragraphs => 42
    end
    pdf.move_down(8)
    pdf.text "Event Scenario: #{item.event_scenario}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event Scenario Summary:", :indent_paragraphs => 30
    pdf.move_down(3)
    sums = Sanitize.clean(item.event_scenario_summary)
    pdf.span(330, :position => :center) do
      pdf.text sums, :indent_paragraphs => 42
    end
    pdf.move_down(8)
    pdf.text "Statewide Event and/or MutiState Event: #{item.statewide_event}", :indent_paragraphs => 30
    pdf.move_down(8)
    pdf.text "Event Participants:", :indent_paragraphs => 30
    pdf.move_down(3)
    item.eparticipants.each do |participant|
      pdf.text "• #{participant.name}", :indent_paragraphs => 42
    end
    pdf.move_down(8)
    pdf.text "Role of the State Emergency Management Program:", :spacing => 16, :indent_paragraphs => 30
    roll = Sanitize.clean(item.ema_role)
    pdf.span(330, :position => :center) do
      pdf.text roll
    end

    #       TCL Data
    pdf.move_down(12)
    pdf.text "Target Capabilities, Corrective Actions & Strengths:", :size => 13, :spacing => 16, :style => :bold, :indent_paragraphs => 27
    item.tcls.each do |target|
      pdf.move_down(18)
      pdf.text "• #{target.tcap}", :spacing => 16, :style => :bold, :indent_paragraphs => 42
      pdf.move_down(3)
      pdf.text "Activity Level(s):", :spacing => 16, :indent_paragraphs => 42
      target.alevels.each do |activity| 
        pdf.text "• #{activity.name}", :spacing => 16, :indent_paragraphs => 47
      end
      pdf.move_down(8)
      pdf.text "Strength(s):", :spacing => 16, :indent_paragraphs => 42
      pdf.move_down(3)
      pdf.span(330, :position => :center) do
        target.strengths.each do |stren|
          sname = Sanitize.clean(stren.name)
          pdf.text sname, :spacing => 16, :indent_paragraphs => 47
        end
      end
      pdf.move_down(8)
      pdf.text "Area(s) of Improvement:", :spacing => 16, :indent_paragraphs => 42
      pdf.move_down(3)
      pdf.span(330, :position => :center) do
        target.improvement_areas.each do |aoi|
          aname = Sanitize.clean(aoi.name)
          pdf.text aname
        end
      end
      pdf.move_down(8)
      #pdf.text "Summary:", :spacing => 16, :indent_paragraphs => 42
      #pdf.move_down(3)
      #  sum = Sanitize.clean(target.summary)
      #pdf.span(330, :position => :center) do
      #  pdf.text #(target.summary), :spacing => 16, :indent_paragraphs => 47
      #end

      #     Corrective Actions
      pdf.move_down(12)
      pdf.text "Corrective Actions:", :spacing => 16, :indent_paragraphs => 42
      target.corrective_actions.each do |cas|
        pdf.move_down(8)
        pdf.text "• #{cas.name}", :spacing => 16, :indent_paragraphs => 42
        pdf.move_down(3)
        pdf.text "Assigned To: #{cas.assigned_to}", :indent_paragraphs => 47
        pdf.text "Completed By: #{cas.completed_by}", :indent_paragraphs => 47
        pdf.text "Completed Date: #{cas.completed_date}", :indent_paragraphs => 47
        pdf.move_down(8)
          robs = Sanitize.clean(cas.reviewer_ob)
        pdf.text "Reviewer Findings:", :indent_paragraphs => 40
        pdf.text robs, :indent_paragraphs => 47
      end
      pdf.move_down(8)
      pdf.text "Improvement Plan Provided: #{target.improvement_plan}", :spacing => 16, :indent_paragraphs => 42
      pdf.text "Improvement Plan Completed: #{target.improvement_plan_completed}", :spacing => 16, :indent_paragraphs => 42
    end

    #     Lessons Learned
    pdf.move_down(12)
    pdf.text "Lessons Learned:", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 30
    item.learned_lessons.each do |lesson|
      pdf.move_down(3)
      pdf.text "• #{lesson.title}", :spacing => 16, :indent_paragraphs => 42
        lsl = Sanitize.clean(lesson.description)
      pdf.span(350, :position => :center) do
        pdf.text lsl, :spacing => 16, :indent_paragraphs => 20
      end
    end

    #     Uploads *EVENT*
    pdf.move_down(12)
    pdf.text "Documents Reviewed:", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 20
    pdf.move_down(3)
    item.uploads.each do |proof|
      pdf.text "• #{proof.proof_file_name}", :spacing => 16, :size => 12, :indent_paragraphs => 37
    end
  end

  #   Uploads *PROGRAM*
  @program.uploads.each do |docs|
    pdf.text "• #{docs.proof_file_name}", :spacing => 16, :size => 12, :indent_paragraphs => 37
  end

  #     Interviews
  pdf.move_down(12)
  pdf.text "Interviews:", :spacing => 16, :size => 14, :style => :bold, :indent_paragraphs => 20
  @program.findings.each do |finding|
    finding.interviews.each do |interview|
      pdf.move_down(8)
      pdf.text "#{interview.name}, #{interview.title} - #{interview.date}", :spacing => 16, :indent_paragraphs => 47
      pdf.move_down(3)
        sums = Sanitize.clean(interview.summary)
      pdf.text sums, :spacing => 16, :indent_paragraphs => 50
    end
  end

  #   Page Numbering
  #pdf.number_pages "<page> of <total>", [pdf.bounds.right - 50, 0]
  pdf.bounding_box [510, 10], :width => 30 do
    pdf.page_count.times do |i|
       pdf.go_to_page(i+1)
       pdf.text "#{i + 1}", :align => :left, :size => 9
    end
  end

  #pdf.render_file('public/documents/ESR_Report_#{@program.id}.pdf')

#end
