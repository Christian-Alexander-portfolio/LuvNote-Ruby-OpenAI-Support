# LuvNote AI Support Chat

A full-stack Ruby on Rails application that provides an AI-powered support chat interface for the LuvNote app. Built to demonstrate proficiency in Rails development and the transferability of full-stack engineering principles across frameworks.

## About This Project

As an experienced full-stack developer with expertise in modern JavaScript/TypeScript frameworks, I built this project to showcase how software engineering fundamentals translate seamlessly across technology stacks. The core principles of MVC architecture, RESTful design, database modeling, and component-based UI development remain consistent regardless of the framework.

This project demonstrates that a strong foundation in full-stack development enables rapid adoption of new technologies like Ruby on Rails.

## Tech Stack

### Backend
- **Ruby on Rails 8.1** - Full MVC framework with convention over configuration
- **PostgreSQL** - Primary database for all application data
- **OpenAI API** - GPT-4 integration for intelligent query routing and response generation

### Frontend
- **ERB Templates** - Server-rendered views with embedded Ruby
- **Vanilla JavaScript** - Client-side interactivity (modals, form handling)
- **CSS3** - Custom "Velvet" dark theme with CSS variables, gradients, and animations

### Infrastructure
- **Heroku** - Cloud deployment with managed PostgreSQL
- **Solid Cache/Queue/Cable** - Rails 8 defaults for caching, background jobs, and WebSockets

## Features

### User-Facing
- **AI Support Chat** - Natural language queries routed to relevant support articles
- **Confidence Scoring** - Displays AI confidence level for each response
- **Deep Linking** - Direct links to in-app features or support documentation
- **Session Persistence** - Conversations persist across page refreshes via cookies
- **Clear Conversation** - Users can clear chat history while data is retained for analytics

### Admin Dashboard
- **Analytics Overview** - Total conversations, messages, and daily activity metrics
- **Conversation Browser** - View all user conversations with message previews
- **Full Message History** - See complete conversation logs including "cleared" messages
- **Protected Access** - Simple code-based authentication for admin features

## Architecture Overview

```
app/
├── controllers/
│   ├── chat_controller.rb      # Main chat interface & message handling
│   ├── admin_controller.rb     # Admin dashboard & conversation viewing
│   └── support_controller.rb   # Static support page rendering
├── models/
│   ├── conversation.rb         # User session tracking
│   ├── message.rb              # Chat messages with metadata
│   └── support_page.rb         # Support article content
├── services/
│   ├── conversation_finder.rb  # Cookie-based session management
│   └── openai_support_router.rb # AI query routing logic
└── views/
    ├── chat/                   # Chat interface templates
    ├── admin/                  # Dashboard templates
    └── support/                # Support article templates
```

## Database Schema

| Table | Purpose |
|-------|---------|
| `conversations` | Tracks user sessions with visitor ID, timestamps, and clear status |
| `messages` | Stores all chat messages with role, content, confidence, and routing data |
| `support_pages` | Support article content with titles, summaries, and deep links |
| `admin_sessions` | Admin authentication tokens |
| `event_logs` | Analytics and debugging logs |

## Key Implementation Details

### AI-Powered Routing
The `OpenaiSupportRouter` service analyzes user queries and matches them to relevant support articles using GPT-4. It returns:
- A confidence score (0-1) indicating match quality
- The matched support page (if any)
- A contextual answer tailored to the user's question

### Session Management
`ConversationFinder` implements cookie-based session tracking without requiring user authentication:
- Generates unique visitor IDs stored in permanent cookies
- Associates all messages with the visitor's conversation
- Supports "soft clear" - users can clear their view while data persists for admin review

### Responsive Design
The custom "Velvet" theme uses CSS variables for consistent theming:
- Dark gradient backgrounds with pink/magenta accents
- Glassmorphism effects on modals
- Mobile-responsive layouts with flexbox/grid

## Local Development

### Prerequisites
- Ruby 3.4+
- PostgreSQL 14+
- Node.js (for asset compilation)

### Setup
```bash
# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Set environment variables
export OPENAI_API_KEY=your_key_here

# Start server
rails server
```

### Environment Variables
| Variable | Description |
|----------|-------------|
| `OPENAI_API_KEY` | OpenAI API key for GPT-4 access |
| `DATABASE_URL` | PostgreSQL connection string (production) |
| `RAILS_MASTER_KEY` | Encryption key for credentials |

## Deployment (Heroku)

```bash
# Create app and add PostgreSQL
heroku create your-app-name
heroku addons:create heroku-postgresql:essential-0

# Set environment variables
heroku config:set OPENAI_API_KEY=your_key
heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)

# Deploy
git push heroku main

# Run migrations and seed data
heroku run rails db:migrate
heroku run rails db:seed
```

## Transferable Skills Demonstrated

| Concept | Rails Implementation | Equivalent in Other Stacks |
|---------|---------------------|---------------------------|
| MVC Architecture | Controllers, Models, Views | Express/NestJS, Django, Laravel |
| ORM & Migrations | ActiveRecord | Prisma, TypeORM, Sequelize, Django ORM |
| Routing | `config/routes.rb` | React Router, Next.js, Express Router |
| Template Engine | ERB | JSX, Jinja2, Blade, EJS |
| Session Management | Cookies + DB | JWT, Sessions in any framework |
| Background Jobs | Solid Queue | Bull, Celery, Laravel Queues |
| Database Design | PostgreSQL schemas | Universal across stacks |
| RESTful APIs | Resource routing | Standard REST patterns |
| CSS Architecture | CSS variables, BEM-like | Same principles everywhere |

## Conclusion

This project validates that experienced full-stack developers can quickly become productive in Ruby on Rails. The patterns are familiar:

- **Models** behave like any ORM entity
- **Controllers** handle HTTP requests like Express/NestJS handlers
- **Views** are templates with embedded logic, just like JSX or Jinja2
- **Services** encapsulate business logic, a universal pattern
- **Migrations** manage schema changes, identical concept to any ORM

The Rails-specific conventions (naming, file structure, generators) are learnable in days, while the underlying engineering principles transfer directly from years of full-stack experience.

---

Built by a full-stack developer demonstrating framework adaptability.
