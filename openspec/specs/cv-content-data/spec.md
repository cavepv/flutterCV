### Requirement: Real profile identity and about content
The system SHALL display Carlos Palomeque Vela's real name, professional
tagline, and about/bio text sourced from his CV, replacing all placeholder
identity content.

#### Scenario: About screen shows real identity
- **WHEN** the user opens the About tab
- **THEN** the screen displays the name "Carlos Palomeque Vela" (or full
  name "Carlos Eduardo Palomeque Vela"), a tagline reflecting his real role
  (e.g. "Senior Software Engineer"), and an about paragraph derived from the
  CV's Presentation section (not lorem-ipsum placeholder text)

### Requirement: Real contact information
The system SHALL expose Carlos's real, working contact channels (email,
phone, LinkedIn, GitHub) so a recruiter can reach him directly from the app.

#### Scenario: Contact screen shows real reachable channels
- **WHEN** the user opens the Contact tab
- **THEN** the screen displays the real email address, real phone number,
  and a real LinkedIn profile URL sourced from the CV
- **AND** each entry remains tappable to open the corresponding
  mailto/tel/https link via `url_launcher`, unchanged from existing behavior

### Requirement: Real, condensed work experience
The system SHALL display Carlos's real professional work history as a list
of jobs, each condensed to a short set of highlight bullets that fit the
existing card-based UI, covering his current role and prior professional
roles from the CV.

#### Scenario: Experience screen lists real jobs
- **WHEN** the user opens the Experience tab
- **THEN** the screen displays, at minimum, the current role (Software
  Engineer Consultant at Volvo Cars via Acorn Technology) and the three
  prior professional roles (CPAC Systems, Alten Sweden/Epiroc Rocktec,
  Combitech/Volvo Construction Equipment), each with title, company, period,
  and no more than 4 condensed highlight bullets
- **AND** internships and summer jobs are not included in this list

### Requirement: Real technical skills grouped by category
The system SHALL display Carlos's real technical skills, deduplicated and
grouped into categories, replacing the placeholder skill chips.

#### Scenario: Skills screen shows real, categorized skills
- **WHEN** the user opens the Skills tab
- **THEN** the screen displays skill chips grouped under categories (at
  minimum Languages, Frameworks/Platforms, and Tools), where the chip values
  reflect technologies actually listed in the CV (e.g. Java, Kotlin, C++,
  Python, AOSP/Android Automotive OS) with no duplicate entries within a
  category

### Requirement: Real education history
The system SHALL display Carlos's real education history, replacing the
placeholder degree entry.

#### Scenario: Education screen shows real degree
- **WHEN** the user opens the Education tab
- **THEN** the screen displays "Master of Science in Media Technology and
  Engineering" from Linköping University with period 2008-2013

### Requirement: Spoken languages displayed on About screen
The system SHALL display Carlos's spoken languages and proficiency levels,
since this information exists in the CV but has no existing data field.

#### Scenario: About screen shows spoken languages
- **WHEN** the user opens the About tab
- **THEN** the screen displays a list of spoken languages with proficiency
  (Swedish - native, English - fluent, Spanish - fluent, French - beginner)
  in addition to the existing about/bio content
