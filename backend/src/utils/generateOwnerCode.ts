import crypto from "crypto";

export const generateOwnerCode = (): string => {
  const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  let id = "OWN-";

  for (let i = 0; i < 6; i++) {
    const randomIndex = crypto.randomInt(0, chars.length);
    id += chars[randomIndex];
  }

  return id;
};
