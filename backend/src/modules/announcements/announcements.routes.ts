import Router from "express";
import {
  createAnnouncementController,
  deleteAnnouncementController,
  fetchAnnouncementsController,
  updateAnnouncementController,
} from "./announcements.controller.ts";
import { createAnnouncementSchema } from "./announcements.validation.ts";
import { validator } from "../../middlewares/validator.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";

const router = Router();

router.get("/", authMiddleware, fetchAnnouncementsController);
router.post(
  "/create",
  validator(createAnnouncementSchema),
  authMiddleware,
  createAnnouncementController,
);

router.delete("/:announcementId", authMiddleware, deleteAnnouncementController);

router.patch("/:announcementId", authMiddleware, updateAnnouncementController);

const announcementRouter = router;

export default announcementRouter;
