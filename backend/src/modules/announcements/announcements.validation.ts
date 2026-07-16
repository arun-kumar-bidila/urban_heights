import Joi from "joi";

export const createAnnouncementSchema = Joi.object({
  title: Joi.string().trim().min(2).required().messages({
    "string.min": "title must be at least 2 characters",
    "string.empty": "title is required",
    "any.required": "title is required",
  }),
  description: Joi.string().trim().min(2).required().messages({
    "string.min": "description must be at least 2 characters",
    "string.empty": "description is required",
    "any.required": "description is required",
  }),
  datePosted: Joi.string().trim().required().messages({
    "string.empty": "datePosted is required",
    "any.required": "datePosted is required",
  }),
}).strict();
