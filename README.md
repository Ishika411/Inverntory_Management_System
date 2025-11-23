nventory Management System — PostgreSQL | PL/pgSQL | SQL

This project implements a fully structured and production-ready Inventory Management System built using PostgreSQL, focusing on database normalization, automation, and analytical querying. The system is designed to manage products, suppliers, purchases, and sales with real-time stock updates and robust data integrity.

The core database schema follows 1NF–3NF normalization and includes well-defined primary keys, foreign keys, default values, check constraints, and indexing to maintain referential integrity and optimize query performance. Modular SQL scripts (schema.sql, tables.sql, sample_data.sql, triggers.sql, views.sql, business_queries.sql) ensure environment-independent execution and maintainability.

To enable real-time stock accuracy, the system uses PL/pgSQL triggers and functions that automatically increase inventory on purchases and decrease it on sales. This eliminates manual intervention and reduces inconsistency across transactions.

The project also includes a set of SQL views that abstract sensitive or repetitive data, support role-based access, and simplify reporting workflows. Additional business-logic queries provide insights such as top-selling products, monthly revenue, inventory valuation, low-stock alerts, and supplier activity—offering analytical capabilities similar to industry inventory dashboards.

All SQL scripts were created and managed in VS Code and executed/tested using pgAdmin.
