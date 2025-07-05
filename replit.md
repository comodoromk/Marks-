# Marks Finanças - Personal Finance Manager

## Overview

This is a personal finance management application built with React and Express.js. The app allows users to track their income and expenses, view transaction history, and visualize their financial data through interactive charts. It features a mobile-first design with Portuguese language support and includes a custom logo with settings dropdown menu.

## System Architecture

### Frontend Architecture
- **Framework**: React 18 with TypeScript
- **Styling**: Tailwind CSS with shadcn/ui components
- **State Management**: React Query (TanStack Query) for server state
- **Routing**: Wouter for client-side routing
- **Forms**: React Hook Form with Zod validation
- **Charts**: Recharts for data visualization
- **Build Tool**: Vite

### Backend Architecture
- **Framework**: Express.js with TypeScript
- **Database**: Configured for PostgreSQL with Drizzle ORM
- **Session Management**: Uses connect-pg-simple for session storage
- **File Upload**: Multer for handling background image uploads
- **Runtime**: Node.js with ESM modules

### Mobile-First Design
- Responsive layout optimized for mobile devices
- Maximum width container (max-w-md) for mobile app experience
- Touch-friendly UI components
- Custom gradient header with background image support

## Key Components

### Data Models
- **Transactions**: Core entity with id, name, value, and createdAt fields
- **Users**: Authentication entity with username and password (defined but not implemented)

### Frontend Components
- **TransactionForm**: Form for adding new income/expense transactions
- **TransactionList**: Display and management of transaction history
- **BalanceCard**: Summary view of total balance, income, and expenses
- **FinanceChart**: Pie chart visualization of income vs expenses
- **BackgroundModal**: Custom background image upload functionality
- **ThemeProvider**: Light/dark theme switching
- **Settings Dropdown**: Organized menu with theme toggle and background customization

### API Endpoints
- `GET /api/transactions` - Retrieve all transactions
- `POST /api/transactions` - Create new transaction
- `DELETE /api/transactions/:id` - Delete specific transaction
- `POST /api/background` - Upload background image (planned)

## Data Flow

1. **Transaction Creation**: User fills form → Validation with Zod → API call → Database update → UI refresh
2. **Data Fetching**: React Query manages server state → Automatic caching and refetching
3. **Real-time Updates**: Query invalidation triggers UI updates after mutations
4. **Theme Management**: Local storage persistence with CSS variable updates

## External Dependencies

### UI and Styling
- **Radix UI**: Unstyled, accessible component primitives
- **Tailwind CSS**: Utility-first CSS framework
- **Lucide React**: Icon library
- **class-variance-authority**: Variant-driven component styling

### Backend Services
- **Neon Database**: PostgreSQL hosting (@neondatabase/serverless)
- **Drizzle ORM**: Type-safe database operations
- **Multer**: File upload handling

### Development Tools
- **Vite**: Fast build tool with HMR
- **TypeScript**: Static type checking
- **ESBuild**: Fast JavaScript bundler for production

## Deployment Strategy

### Development
- Vite dev server for frontend with HMR
- Express server with TypeScript execution via tsx
- Database migrations through Drizzle Kit
- Replit-specific development features enabled

### Production Build
- Frontend: Vite build → static files in dist/public
- Backend: ESBuild bundle → single file in dist/index.js
- Database: Schema pushes via `db:push` command
- Environment: Node.js production server

### Database Setup
- PostgreSQL with Drizzle ORM
- Migration files in ./migrations directory
- Schema defined in shared/schema.ts
- Connection via DATABASE_URL environment variable

## Changelog

```
Changelog:
- July 04, 2025. Initial setup
- July 04, 2025. Added settings dropdown menu with gear icon
- July 04, 2025. Updated app name to "Marks Finanças" with custom logo
- July 04, 2025. Organized theme toggle and background customization in dropdown
- July 04, 2025. Implemented real-time finance sharing with QR Code functionality
- July 04, 2025. Added WebSocket support for real-time synchronization
- July 04, 2025. Created complete APK build structure with Capacitor
- July 04, 2025. Configured Android project with custom logo and branding
```

## User Preferences

```
Preferred communication style: Simple, everyday language.
```