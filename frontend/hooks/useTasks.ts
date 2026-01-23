// frontend/hooks/useTasks.ts
import { useState, useEffect, useCallback } from "react";
import type { Task } from "@/types";
import { ApiError, taskApi } from "@/lib/api-client";

interface UseTasksReturn {
  tasks: Task[];
  fetchTasks: () => Promise<void>;
}

export function useTasks(): UseTasksReturn {
  const [tasks, setTasks] = useState<Task[]>([]);

  const fetchTasks = useCallback(async () => {
    try {
      const data = await taskApi.getTasks();
      setTasks(data);
    } catch (err) {
      if (err instanceof ApiError) console.error(err.message);
    }
  }, []);

  useEffect(() => {
    fetchTasks();
  }, [fetchTasks]);

  return { tasks, fetchTasks };
}
