using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShootingClub.Entities
{
    /// <summary>
    /// Класс корзина, содержит список покупок
    /// </summary>
    public class Basket
    {
        /// <summary>
        /// Value словаря - количество товара и стоимость
        /// </summary>
        public struct BuyItem
        {
            public int Count { get; set; }
            public double Total { get; set; }
        }
        /// <summary>
        /// Словарь хранит товар в качестве ключа и BuyItem в качестве значения
        /// </summary>
        public static Dictionary<Pricelist, BuyItem> GetBasket { get; } = new Dictionary<Pricelist, BuyItem>();

        // очистка корзины
        public static void ClearBasket()
        {
            GetBasket.Clear();
        }
        /// <summary>
        /// Добавление товара в корзину
        /// </summary>
        /// <param name="product">Добавляемый товар</param>
        public static void AddProductInBasket(Pricelist pricelist)
        {
            // если такой товар есть в корзине
            if (!GetBasket.ContainsKey(pricelist))
            {
                // добавляем новый товар в корзину в количесьве 1 шт
                double p = Convert.ToDouble(pricelist.Price);
                GetBasket[pricelist] = new BuyItem { Count = 1, Total = p };
            }
        }
        /// <summary>
        /// Изменяет количество товара product в корзине
        /// </summary>
        /// <param name="pricelist">Товар</param>
        /// <param name="count">количество товара</param>
        public static void SetCount(Pricelist pricelist, int count)
        {
            if (GetBasket.ContainsKey(pricelist))
            {
                int k = count;
                double p = Convert.ToDouble(pricelist.Price * k);
                GetBasket[pricelist] = new BuyItem { Count = k, Total = p };
                // если количество 0 или меньше 0 удаляем товар из корзины
                if (k <= 0)
                {
                    GetBasket.Remove(pricelist);
                }
            }
        }

        /// <summary>
        /// Удаляем товар product из корзины
        /// </summary>
        /// <param name="product">Удаляемый товар</param>
        public static void DeleteProductFromBasket(Pricelist pricelist)
        {
            if (GetBasket.ContainsKey(pricelist))
            {
                GetBasket.Remove(pricelist);
            }
        }

        /// <summary>
        /// Cтоимость всех товаров в корзине
        /// </summary>
        public static double GetTotalCost
        {
            get
            {
                double sum = 0;
                foreach (var item in GetBasket)
                {
                    sum += item.Value.Total;
                }
                return sum;
            }
        }
        /// <summary>
        /// Количество товаров в корзине
        /// </summary>
        public static int GetCount
        {
            get
            {
                return GetBasket.Count;
            }
        }
    }
}

