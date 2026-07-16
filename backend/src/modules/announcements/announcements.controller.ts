import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";
import {
  createAnnouncement,
  fetchAnnouncements,
  updateAnnouncement,
} from "./announcements.services.ts";
import { sendResponse } from "../../utils/sendResponse.ts";
import type { Response } from "express";

import { deleteAnnouncement } from "./announcements.services.ts";

export const fetchAnnouncementsController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const apartmentId = req.userId as string;

    const result = await fetchAnnouncements(apartmentId);

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
      data: result.announcements,
    });
  },
);

export const createAnnouncementController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const { title, description, datePosted } = req.body;
    const apartmentId = req.userId as string;

    const result = await createAnnouncement({
      title,
      description,
      datePosted,
      apartmentId,
    });

    sendResponse(res, {
      statusCode: 201,
      message: result.message,
    });
  },
);

export const deleteAnnouncementController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const announcementId = req.params.announcementId as string;

    const result = await deleteAnnouncement(announcementId);

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
    });
  },
);

export const updateAnnouncementController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const announcementId = req.params.announcementId as string;
    const { pinned } = req.body;
    const result = await updateAnnouncement({ announcementId, pinned });

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
    });
  },
);
