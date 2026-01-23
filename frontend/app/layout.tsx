import "./globals.css";
import { Providers } from "@/components/Providers";
import { Header } from "@/components/Header";
import type { Metadata } from "next";
import { Geist } from "next/font/google";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Todo App",
  description: "Spec Driven Development Todo App",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={`${geistSans.variable} antialiased`}>
        <Providers>
          <Header />
          <main className="min-h-screen bg-zinc-50 dark:bg-zinc-950">
            {children}
          </main>
        </Providers>
      </body>
    </html>
  );
}
